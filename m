Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 729CE11764
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 12:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=BWEtj9ytkD7XjlEsYMqAYSGHkQyslesinbdu0RuXgkk=; b=2lQzV/ejxfLaNxtQYpcYYGz5rY
	K/Uj5GEWgxKxvpiy1zEGP7DogG9zBj6WjpDPsrhZCJ3VwLv/u5uJuLu/UDyd0OVOZ/GQebJNTASVj
	w6b/YnapNXI6X2k2psHA9fWdR/k3g3INHRHe4ABLUmFKlx9pDYdZ/DdkbxObG/BLxsYF3qQ6kwTRj
	ygasf8TrRXM8OiGAEyfv1+dTsFRXSdY18LztzmB82jOkcOCWKOn8LeO5kb8QL/EZTJq5e4wQfoZc6
	RF+T+ZtCmZtDxBapnWsl9YtNepIPoJKx6fBens3CZtqPuEi3xqivUDMp5kChnub1Mi402/wAmXH8Q
	bdhWQZkA==;
Received: from localhost ([::1]:43698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hM99J-0020BF-3M; Thu, 02 May 2019 10:41:09 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:46605 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hM99C-0020B8-B1
 for samba-technical@lists.samba.org; Thu, 02 May 2019 10:41:06 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44vsHV1hFtz9s9y;
 Thu,  2 May 2019 20:40:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1556793654; bh=/d99CF5dso9pTtL25J+ZafXl1d/DEYRrEPqXFscjXMw=;
 h=Date:From:To:Subject:From;
 b=t5vM5kChzWIkSjMCL7X0a7X6jwNGpqdzmVQLaRGYcAc6BeBpMjKti2VFhnuwq60GD
 a7E2JSzvdc2gGzH9TELnk5UxhPZWH4U0SM610NKV4bbW9mO49vQno/sQYj9cBrGe66
 moGDP8IQ3JxjCekvxsVAMoaPWMd9LS7mTU1VErzFYR5bt1Jvw1w8sUMnryrvkTorjo
 0ESnLM8g6XE5zADdzqIv9/GHSPOg98P8dVpzKSsQFNfK7w/U4r+Q2Wq9YWeROkLKtY
 49KCOfKEC4zyBere79j2rq++scEmdX/le9k4z9sDyjyU/DqBcc72V+NZNlTqk2PMv3
 nBUWw0+BioaZA==
Date: Thu, 2 May 2019 20:40:52 +1000
To: Samba Technical <samba-technical@lists.samba.org>
Subject: [PATCH] Add logging of ctdbd CPU utilisation
Message-ID: <20190502204052.4147c589@martins.ozlabs.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/gtzKQHm53sQ7TtktQKaeOf4"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

--MP_/gtzKQHm53sQ7TtktQKaeOf4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

There have been situations where ctdbd spins at 100% of a CPU thread
due to heavy contention for records.  However, without performance
logs this can't be diagnosed.

This patch will make ctdbd log CPU utilisation when it exceeds 90%.

Pipeline: https://gitlab.com/samba-team/devel/samba/pipelines/59394125

Please review and maybe push...

peace & happiness,
martin

--MP_/gtzKQHm53sQ7TtktQKaeOf4
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=ctdb-utilisation.patch

From 5a7c2dacecbd2085e6de621530abd75fe697172a Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 18 Jan 2019 17:43:44 +1100
Subject: [PATCH 1/2] ctdb-build: Add check for getrusage()

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/wscript | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ctdb/wscript b/ctdb/wscript
index 7873130d5ee..4f2fcbf69c9 100644
--- a/ctdb/wscript
+++ b/ctdb/wscript
@@ -180,6 +180,7 @@ def configure(conf):
         Logs.error('Need sched_setscheduler()')
         sys.exit(1)
     conf.CHECK_FUNCS('mlockall')
+    conf.CHECK_FUNCS('getrusage', headers="sys/time.h sys/resource.h")
 
     if not conf.CHECK_VARIABLE('ETIME', headers='errno.h'):
         conf.DEFINE('ETIME', 'ETIMEDOUT')
-- 
2.20.1


From ad945b2ae1e43020dfcf64b378e8183264f2bd4d Mon Sep 17 00:00:00 2001
From: Martin Schwenke <martin@meltin.net>
Date: Fri, 18 Jan 2019 17:46:37 +1100
Subject: [PATCH 2/2] ctdb-daemon: Log when ctdbd CPU utilisation exceeds a
 threshold

This is to help us notice when ctdbd is using the full capacity of a
CPU, so is saturated.

Signed-off-by: Martin Schwenke <martin@meltin.net>
---
 ctdb/server/ctdb_daemon.c | 123 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/ctdb/server/ctdb_daemon.c b/ctdb/server/ctdb_daemon.c
index a8691388d4a..c5733bb2592 100644
--- a/ctdb/server/ctdb_daemon.c
+++ b/ctdb/server/ctdb_daemon.c
@@ -72,7 +72,126 @@ static void print_exit_message(void)
 	}
 }
 
+#ifdef HAVE_GETRUSAGE
 
+struct cpu_check_threshold_data {
+	unsigned short percent;
+	struct timeval timeofday;
+	struct timeval ru_time;
+};
+
+static void ctdb_cpu_check_threshold(struct tevent_context *ev,
+				     struct tevent_timer *te,
+				     struct timeval tv,
+				     void *private_data)
+{
+	struct ctdb_context *ctdb = talloc_get_type_abort(
+		private_data, struct ctdb_context);
+	uint32_t interval = 60;
+
+	static unsigned short threshold = 0;
+	static struct cpu_check_threshold_data prev = {
+		.percent = 0,
+		.timeofday = { .tv_sec = 0 },
+		.ru_time = { .tv_sec = 0 },
+	};
+
+	struct rusage usage;
+	struct cpu_check_threshold_data curr = {
+		.percent = 0,
+	};
+	int64_t ru_time_diff, timeofday_diff;
+	bool first;
+	int ret;
+
+	/*
+	 * Cache the threshold so that we don't waste time checking
+	 * the environment variable every time
+	 */
+	if (threshold == 0) {
+		const char *t;
+
+		threshold = 90;
+
+		t = getenv("CTDB_TEST_CPU_USAGE_THRESHOLD");
+		if (t != NULL) {
+			int th;
+
+			th = atoi(t);
+			if (th <= 0 || th > 100) {
+				DBG_WARNING("Failed to parse env var: %s\n", t);
+			} else {
+				threshold = th;
+			}
+		}
+	}
+
+	ret = getrusage(RUSAGE_SELF, &usage);
+	if (ret != 0) {
+		DBG_WARNING("rusage() failed: %d\n", ret);
+		goto next;
+	}
+
+	/* Sum the system and user CPU usage */
+	curr.ru_time = timeval_sum(&usage.ru_utime, &usage.ru_stime);
+
+	curr.timeofday = tv;
+
+	first = timeval_is_zero(&prev.timeofday);
+	if (first) {
+		/* No previous values recorded so no calculation to do */
+		goto done;
+	}
+
+	timeofday_diff = usec_time_diff(&curr.timeofday, &prev.timeofday);
+	if (timeofday_diff <= 0) {
+		/*
+		 * Time went backwards or didn't progress so no (sane)
+		 * calculation can be done
+		 */
+		goto done;
+	}
+
+	ru_time_diff = usec_time_diff(&curr.ru_time, &prev.ru_time);
+
+	curr.percent = ru_time_diff * 100 / timeofday_diff;
+
+	if (curr.percent >= threshold) {
+		/* Log only if the utilisation changes */
+		if (curr.percent != prev.percent) {
+			D_WARNING("WARNING: CPU utilisation %hu%% >= "
+				  "threshold (%hu%%)\n",
+				  curr.percent,
+				  threshold);
+		}
+	} else {
+		/* Log if the utilisation falls below the threshold */
+		if (prev.percent >= threshold) {
+			D_WARNING("WARNING: CPU utilisation %hu%% < "
+				  "threshold (%hu%%)\n",
+				  curr.percent,
+				  threshold);
+		}
+	}
+
+done:
+	prev = curr;
+
+next:
+	tevent_add_timer(ctdb->ev, ctdb,
+			 timeval_current_ofs(interval, 0),
+			 ctdb_cpu_check_threshold,
+			 ctdb);
+}
+
+static void ctdb_start_cpu_check_threshold(struct ctdb_context *ctdb)
+{
+	tevent_add_timer(ctdb->ev, ctdb,
+			 timeval_current(),
+			 ctdb_cpu_check_threshold,
+			 ctdb);
+}
+#endif /* HAVE_GETRUSAGE */
 
 static void ctdb_time_tick(struct tevent_context *ev, struct tevent_timer *te,
 				  struct timeval t, void *private_data)
@@ -111,6 +230,10 @@ static void ctdb_start_periodic_events(struct ctdb_context *ctdb)
 
 	/* start listening to timer ticks */
 	ctdb_start_time_tickd(ctdb);
+
+#ifdef HAVE_GETRUSAGE
+	ctdb_start_cpu_check_threshold(ctdb);
+#endif /* HAVE_GETRUSAGE */
 }
 
 static void ignore_signal(int signum)
-- 
2.20.1


--MP_/gtzKQHm53sQ7TtktQKaeOf4--

