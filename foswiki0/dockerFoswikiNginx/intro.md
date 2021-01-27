Welcome to your Katacoda Docker environment!

In this scenario we will set up an operational Foswiki server on a site suporting Apache using a dockr image.

The docker image used is developed by Tim Legge and available on
[docker hub](https://hub.docker.com/r/timlegge/docker-foswiki)
with extensive documentation.

<div style="background-color: khaki; font-size: smaller" >

The Katacoda training environment is somewhat out of the ordinary. This setup installs Foswiki, listening at port 80 for the http protocol.
Access is through the katacoda-services host, which is accessible with the https protocol.
This leads to a mixed access scenario, which is by default not allowed in modern browsers.
For Firefox  you need to turn off all mixed content checking in
[about:config](https://docs.sdl.com/LiveContent/content/en-US/SDL%20Web-v5/GUID-A96F0612-53DE-4E35-AE09-48D57146D6E4).
There are also additional Foswiki configuration requirements. They will be covered in the scenario.
<p />
**Please note** that you are `root`on the server.
If you are not a user with root privileges, some commands will need to be `sudo'ed`.Last update: Tuesday 24 March  18:31:15 AEDT 2020
</div>


Last update: Fri 24 Apr 16:29:04 AEST 2020
Last update: Sun 26 Apr 12:40:03 AEST 2020
Last update: Sun 26 Apr 13:06:28 AEST 2020
Last update: Sun 26 Apr 14:16:43 AEST 2020
Last update: Sun 26 Apr 15:20:37 AEST 2020
Last update: Sun 26 Apr 17:52:53 AEST 2020
Last update: Sun 26 Apr 18:06:07 AEST 2020
Last update: Sun 26 Apr 21:42:17 AEST 2020
Last update: Mon 27 Apr 14:14:05 AEST 2020
Last update: Mon 27 Apr 16:32:42 AEST 2020
Last update: Mon 27 Apr 17:47:37 AEST 2020
Last update: Mon 27 Apr 19:12:14 AEST 2020
Last update: Tue 28 Apr 14:33:02 AEST 2020
Last update: Tue 28 Apr 18:09:51 AEST 2020
Last update: Wed 29 Apr 14:45:56 AEST 2020
Last update: Wed 29 Apr 15:00:43 AEST 2020
Last update: Wed 29 Apr 16:54:48 AEST 2020
Last update: Fri  1 May 14:52:33 AEST 2020
Last update: Fri  1 May 17:46:18 AEST 2020
Last update: Fri  1 May 17:49:21 AEST 2020
Last update: Sun  3 May 15:42:52 AEST 2020
Last update: Sun  3 May 16:14:29 AEST 2020
Last update: Sun  3 May 17:41:36 AEST 2020
Last update: Mon  4 May 13:55:30 AEST 2020
Last update: Mon  4 May 13:56:07 AEST 2020
Last update: Mon  4 May 15:49:26 AEST 2020
Last update: Mon  4 May 16:38:21 AEST 2020
Last update: Mon  4 May 17:05:51 AEST 2020
Last update: Tue  5 May 16:44:04 AEST 2020
Last update: Tue  5 May 16:58:06 AEST 2020
Last update: Thu  7 May 16:58:25 AEST 2020
Last update: Thu  7 May 23:13:52 AEST 2020
Last update: Tue  2 Jun 12:05:53 AEST 2020
Last update: Tue  2 Jun 12:10:44 AEST 2020
Last update: Tue  2 Jun 12:12:49 AEST 2020
Last update: Tue  2 Jun 12:19:28 AEST 2020
Last update: Tue  2 Jun 13:28:15 AEST 2020
Last update: Tue  2 Jun 14:12:32 AEST 2020
Last update: Tue  2 Jun 14:34:28 AEST 2020
Last update: Tue  2 Jun 15:10:35 AEST 2020
Last update: Tue  2 Jun 15:51:09 AEST 2020
Last update: Tue  2 Jun 16:00:09 AEST 2020
Last update: Mon 22 Jun 09:30:39 AEST 2020
Last update: Tue 23 Jun 23:12:13 AEST 2020
Last update: Tue 30 Jun 12:52:10 AEST 2020
Last update: Tue 30 Jun 12:54:45 AEST 2020
Last update: Tue 30 Jun 13:07:00 AEST 2020
Last update: Tue 30 Jun 13:59:59 AEST 2020
Last update: Tue 30 Jun 14:47:50 AEST 2020
Last update: Tue 30 Jun 14:48:12 AEST 2020
Last update: Tue 30 Jun 15:07:57 AEST 2020
Last update: Tue 30 Jun 15:08:22 AEST 2020
Last update: Tue 30 Jun 15:18:09 AEST 2020
Last update: Tue 30 Jun 16:06:19 AEST 2020
Last update: Tue 30 Jun 16:09:10 AEST 2020
Last update: Tue 30 Jun 17:12:48 AEST 2020
Last update: Wed  1 Jul 14:23:38 AEST 2020
Last update: Tue 14 Jul 14:12:07 AEST 2020
Last update: Tue 14 Jul 15:26:31 AEST 2020
Last update: Wed 15 Jul 13:46:51 AEST 2020
Last update: Wed 15 Jul 16:32:30 AEST 2020
Last update: Wed 15 Jul 17:02:35 AEST 2020
Last update: Tue 21 Jul 15:46:38 AEST 2020
Last update: Tue 21 Jul 16:07:52 AEST 2020
Last update: Wed 22 Jul 13:41:08 AEST 2020
Last update: Wed 22 Jul 13:51:02 AEST 2020
Last update: Wed 22 Jul 14:20:40 AEST 2020
Last update: Wed 22 Jul 16:20:59 AEST 2020
Last update: Wed 22 Jul 16:39:38 AEST 2020
Last update: Wed 22 Jul 16:50:13 AEST 2020
Last update: Fri 24 Jul 13:35:02 AEST 2020
Last update: Fri 24 Jul 13:53:05 AEST 2020
Last update: Fri 24 Jul 14:51:50 AEST 2020
Last update: Fri 24 Jul 14:52:22 AEST 2020
Last update: Fri 24 Jul 16:07:36 AEST 2020
Last update: Fri 24 Jul 17:12:30 AEST 2020
Last update: Sat 25 Jul 15:16:06 AEST 2020
Last update: Sat 25 Jul 16:27:22 AEST 2020
Last update: Mon 27 Jul 15:37:17 AEST 2020
Last update: Mon 27 Jul 15:38:14 AEST 2020
Last update: Mon 27 Jul 17:05:31 AEST 2020
Last update: Mon 27 Jul 17:05:40 AEST 2020
Last update: Wed 29 Jul 14:05:48 AEST 2020
Last update: Wed 29 Jul 15:18:38 AEST 2020
Last update: Wed 29 Jul 17:21:20 AEST 2020
Last update: Thu 30 Jul 16:34:20 AEST 2020
Last update: Fri 31 Jul 17:35:52 AEST 2020
Last update: Sun  9 Aug 18:09:48 AEST 2020
Last update: Tue 11 Aug 14:20:28 AEST 2020
Last update: Tue 11 Aug 16:14:22 AEST 2020
Last update: Tue 11 Aug 16:39:20 AEST 2020
Last update: Tue 11 Aug 17:03:08 AEST 2020
Last update: Fri 14 Aug 14:43:50 AEST 2020
Last update: Fri 14 Aug 15:29:57 AEST 2020
Last update: Fri 14 Aug 16:46:49 AEST 2020
Last update: Sun 16 Aug 19:35:48 AEST 2020
Last update: Sun 16 Aug 19:47:47 AEST 2020
Last update: Sun 16 Aug 21:55:31 AEST 2020
Last update: Mon 17 Aug 16:58:11 AEST 2020
Last update: Mon 21 Sep 17:56:01 AEST 2020
Last update: Mon 21 Sep 17:58:08 AEST 2020
Last update: Tue 22 Sep 17:17:50 AEST 2020
Last update: Mon 28 Sep 20:01:33 AEST 2020
Last update: Tue 29 Sep 08:05:44 AEST 2020
Last update: Tue 29 Sep 12:29:41 AEST 2020
Last update: Tue 29 Sep 13:27:38 AEST 2020
Last update: Wed 30 Sep 12:23:43 AEST 2020
Last update: Wed 30 Sep 14:33:09 AEST 2020
Last update: Wed 30 Sep 15:02:11 AEST 2020
Last update: Thu  1 Oct 14:43:44 AEST 2020
Last update: Sun  4 Oct 15:37:12 AEDT 2020
Last update: Fri  9 Oct 14:09:39 AEDT 2020
Last update: Mon 12 Oct 17:51:18 AEDT 2020
