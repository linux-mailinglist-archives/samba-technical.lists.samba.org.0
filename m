Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C3C7633DF
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jul 2023 12:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xziwqLiJTi1PCNxzIBcfRK4NHheQzWmIzN1QXy4Qa34=; b=clH7g+AgDri47xbD8uKzbvpJ/v
	Sa8yVV7aYB/WBQvLPXgNEsIp32KCPH8F+T9JAjgbxhNvofE8kp5vGR9KpfQ9gMfRGHCvbI60cSdV5
	wIILz93wSDFFRWBvw01YXjcfgJaNaunhBYTeR2snhTyskVoKrdTqkmuFU/teGmnJlqtKIML4jPlp+
	Mwau0A0YeIbCqJvY1k1JtxsVIwhFA6ZkOZ2z2zDqcdBkExLlmXnE0r6Q+RvFZ7JixcHyGRgwZO8rf
	u8aSUaY3K8Begtp7UZjJHxNSR+j0JWg+VI/s6WcossZLpRnHZm2+ClMc9saq4hUE8ktli0UDgSjrD
	OAh6VDEA==;
Received: from ip6-localhost ([::1]:51452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qObqP-005R5T-QC; Wed, 26 Jul 2023 10:34:13 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:54959
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qObqK-005R5J-GR
 for samba-technical@lists.samba.org; Wed, 26 Jul 2023 10:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1690367634;
 bh=xziwqLiJTi1PCNxzIBcfRK4NHheQzWmIzN1QXy4Qa34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PEUvYM/NW4yCaD1pQLVaa1krZ0zWRK7oH0ZHCurCa1ncfWvWv8RdRnxFm8Teev3kq
 uTyz+FSOxwM/Ri/2Fqxg0w+aSduZiT4T13vllDioEJeKOVupOH7xqQ502c/6dGSzGk
 xSBjr77Bmi9+KMAP1PPveBfJzW10w4SBD/CcKZQntBlC0P9aCIjg44ZT5HBsUBwAMv
 kYxFAlNG9is8zI7B0787AqiUffU+lzg7nDkmJ0V/H76t0I4dKb7LvhEZPs5HkcihGo
 +Q/rqpNaravOEvvH7Z6bDzHmVrS3ErrNgSjhQTbUXt1mxeKRuMbcS4EWGsLIjPUrSu
 t4jnw5pBUZNNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R9qxs6Hygz4whq;
 Wed, 26 Jul 2023 20:33:53 +1000 (AEST)
Date: Wed, 26 Jul 2023 20:33:52 +1000
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: increased `make test` logging in syslog with "debug syslog
 format = always"
Message-ID: <20230726203352.6c6cfa15@martins.ozlabs.org>
In-Reply-To: <bb9223b0-ec58-83ff-bad8-a241fa003ec6@catalyst.net.nz>
References: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
 <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
 <bb9223b0-ec58-83ff-bad8-a241fa003ec6@catalyst.net.nz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 26 Jul 2023 16:42:47 +1200, Douglas Bagnall
<douglas.bagnall@catalyst.net.nz> wrote:

> So, seeing as I started this I feel like I should keep you posted.
> 
> > static void Debug1(const char *msg, size_t msg_len)
> > {
> > 	int old_errno = errno;
> > 	enum debug_logtype logtype = state.logtype;
> > 
> > 	debug_count++;
> > 
> > 	if (state.settings.debug_syslog_format == DEBUG_SYSLOG_FORMAT_ALWAYS) {
> > 		switch(state.logtype) {
> > 		case DEBUG_STDOUT:
> > 		case DEBUG_STDERR:
> > 		case DEBUG_DEFAULT_STDOUT:
> > 		case DEBUG_DEFAULT_STDERR:
> > 			/* Behave the same as logging to a file */
> > 			logtype = DEBUG_FILE;
> > 			break;  
> 
> By treating STDERR et. al. as DEBUG_FILE,...
> 
> 
> > 		default:
> > 			break;
> > 		}
> > 	}
> > 
> > 	switch(logtype) {
> > 	case DEBUG_CALLBACK:
> > 		debug_callback_log(msg, msg_len, current_msg_level);
> > 		break;
> > 	case DEBUG_STDOUT:
> > 	case DEBUG_STDERR:
> > 	case DEBUG_DEFAULT_STDOUT:
> > 	case DEBUG_DEFAULT_STDERR:  
> 
> ...we skip over this straightforward write to the fd...
> 
> > 		if (dbgc_config[DBGC_ALL].fd > 0) {
> > 			ssize_t ret;
> > 			do {
> > 				ret = write(dbgc_config[DBGC_ALL].fd,
> > 					    msg,
> > 					    msg_len);
> > 			} while (ret == -1 && errno == EINTR);
> > 		}
> > 		break;
> > 	case DEBUG_FILE:
> > 		debug_backends_log(msg, msg_len, current_msg_level);  
> 
> ...and loop through all the registered backends.
> 
> When "logging" is not set in smb.conf, the default backend configuration is 
> "syslog@0 file@1000" (via debug_set_settings), so we write to the file *and* 
> syslog (the file is stderr for the Kinit messages).

Well spotted!

Can we just call debug_file_log() directly when necessary, like this?

diff --git a/lib/util/debug.c b/lib/util/debug.c
index b83075cb239..0e13fa564e3 100644
--- a/lib/util/debug.c
+++ b/lib/util/debug.c
@@ -1559,25 +1559,10 @@ void check_log_size( void )
 static void Debug1(const char *msg, size_t msg_len)
 {
 	int old_errno = errno;
-	enum debug_logtype logtype = state.logtype;
 
 	debug_count++;
 
-	if (state.settings.debug_syslog_format == DEBUG_SYSLOG_FORMAT_ALWAYS) {
-		switch(state.logtype) {
-		case DEBUG_STDOUT:
-		case DEBUG_STDERR:
-		case DEBUG_DEFAULT_STDOUT:
-		case DEBUG_DEFAULT_STDERR:
-			/* Behave the same as logging to a file */
-			logtype = DEBUG_FILE;
-			break;
-		default:
-			break;
-		}
-	}
-
-	switch(logtype) {
+	switch(state.logtype) {
 	case DEBUG_CALLBACK:
 		debug_callback_log(msg, msg_len, current_msg_level);
 		break;
@@ -1585,13 +1570,18 @@ static void Debug1(const char *msg, size_t msg_len)
 	case DEBUG_STDERR:
 	case DEBUG_DEFAULT_STDOUT:
 	case DEBUG_DEFAULT_STDERR:
-		if (dbgc_config[DBGC_ALL].fd > 0) {
-			ssize_t ret;
-			do {
-				ret = write(dbgc_config[DBGC_ALL].fd,
-					    msg,
-					    msg_len);
-			} while (ret == -1 && errno == EINTR);
+		if (state.settings.debug_syslog_format ==
+		    DEBUG_SYSLOG_FORMAT_ALWAYS) {
+			debug_file_log(current_msg_level, msg, msg_len);
+		} else {
+			if (dbgc_config[DBGC_ALL].fd > 0) {
+				ssize_t ret;
+				do {
+					ret = write(dbgc_config[DBGC_ALL].fd,
+						    msg,
+						    msg_len);
+				} while (ret == -1 && errno == EINTR);
+			}
 		}
 		break;
 	case DEBUG_FILE:

I haven't tested this.

If it is OK, I think we could also revert the changes to
dbghdrclass(), though we would be generating a header for no
reason... but I think we did that before.

Thoughts?

peace & happiness,
martin

