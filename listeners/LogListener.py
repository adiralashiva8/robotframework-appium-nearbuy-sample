import os
import datetime
import webbrowser

class LogListener:

    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):

        live_logs_file = open('LiveLogs.html','w')
        self.total = 0
        self.passed = 0
        self.failed = 0
        self.content = ""
        
        self.html_text = """
        <html>
	<title>RF Live Results</title>
	<meta http-equiv="refresh" content="100">
		<link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet" />
		<script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
		<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js" type="text/javascript"></script>
		<script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js" type="text/javascript"></script>
		<script>$(document).ready(function() {$('#live').DataTable({"order": [[0, "desc"]],"lengthMenu": [[50, -1], [50, "All"]]});});</script>

	</html>
	<body>
		<table align="center" style="table-layout: fixed ;">
			<td>
				<h3 style="color:#009688;">
					<b>RF Live Results</b>
				</h3>
			</td>
			<td>
				<button class="btn" value="Refresh Page" onClick="window.location.href=window.location.href">Refresh Page</button>
			</td>
		</table>
		<table class="table table-bordered"
		
			<thead>
				<tr style="text-align:center">
					<th>Executed so far</th>
					<th>Passed</th>
					<th>Failed</th>
				</tr>
			</thead>
			<tbody>
				<tr style="text-align:center">
					<td bgcolor="#D3D3D3"><b>__total__</b></td>
					<td bgcolor="#32CD32"><b>__passed__</b></td>
					<td bgcolor="#CD5C5C"><b>__failed__</b></td>
				</tr>
			</tbody>
		</table>
		<table id="live" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Time</th>
					<th>Suite (Tests)</th>
					<th>Test Name</th>
					<th>Test Status</th>
					<th>Message</th>
				</tr>
			</thead>
			<tbody>
			__content__        
        """
        
        updated_message = self.html_text.replace("__total__",str(self.total))
        updated_message = updated_message.replace("__passed__",str(self.passed))
        updated_message = updated_message.replace("__failed__",str(self.failed))
        updated_message = updated_message.replace("__content__",str(self.content))

        live_logs_file.write(updated_message)
        live_logs_file.close()

        current_dir = os.getcwd()
        filename =  current_dir + '/LiveLogs.html'

        webbrowser.open_new_tab(filename)

    def start_suite(self, data, result):
        self.test_count = len(data.tests)

        if self.test_count != 0:
            self.suite_name = data.name
            self.test_start_time = get_current_date_time('%Y-%m-%d %H:%M:%S.%f',True)
    
    def end_test(self, data, test):
        if self.test_count != 0:
            self.total = self.total + 1
            
            status = test.status
            
            if status == 'PASS':
                self.passed = self.passed + 1
            else:
                self.failed = self.failed + 1
            
            live_logs_file = open('LiveLogs.html','w')

            new_message = """
                    <tr>
                        <td style="text-align: left;max-width: 120px;">%s</td>
                        <td style="text-align: left;max-width: 250px;">%s</td>
                        <td style="text-align: left;max-width: 250px;">%s</td>
                        <td style="text-align: center;">%s</td>     
                        <td style="text-align: left;max-width: 250px;">%s</td>                          
                    </tr>
            """ %(str(self.test_start_time), str(self.suite_name), str(test), str(test.status), str(test.message))
            
            self.content += new_message

            new_updated_message = self.html_text.replace("__total__",str(self.total))
            new_updated_message = new_updated_message.replace("__passed__",str(self.passed))
            new_updated_message = new_updated_message.replace("__failed__",str(self.failed))
            new_updated_message = new_updated_message.replace("__content__",str(self.content))

            live_logs_file.write(new_updated_message)
            live_logs_file.close()

def get_current_date_time(format,trim):
    t = datetime.datetime.now()
    if t.microsecond % 1000 >= 500:  # check if there will be rounding up
        t = t + datetime.timedelta(milliseconds=1)  # manually round up
    if trim:
        return t.strftime(format)[:-3]
    else:
        return t.strftime(format)