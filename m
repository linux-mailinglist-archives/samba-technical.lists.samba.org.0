Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8C5189C4D
	for <lists+samba-technical@lfdr.de>; Wed, 18 Mar 2020 13:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=GMP5eq1E+2o0+Ga8CPSANAL5MDDDuS7Z/BFb+a+m+ts=; b=Ap/OIWxboeekUW4qmX1aVW6+5+
	fg7Z5f6bmOI+DDq1+IYRkZRDeYUe1FZ0J8p/ZfaYeuybn2kLbnt5G+kWToKRLMPELtoxpZcFrqXQQ
	vmMoWl6JqhwgMA8jgjF42MYQCfyJyWcWkuHGHP4D9UFJa2NzK79lU9IwGN25up/pCC1gRNN2WQfMA
	kIQwta4whBmLTwgwLM7RcfPL2L5IOO8AiqzjGrDitEhyX9WoVe8k/tDJrHIOQJzqoHOGtt/LUpLEb
	5T2CBDQVM1t1SPi244c6RyBWlZlHDOtjOsZch1n1P33Agd/FhPIR7+4NbZFJ6k7TdH1pG7kCdXhZv
	9v88l0aQ==;
Received: from localhost ([::1]:52780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jEY9f-00027t-UW; Wed, 18 Mar 2020 12:50:40 +0000
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:57169) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jEY9a-00027m-Ix
 for samba-technical@lists.samba.org; Wed, 18 Mar 2020 12:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584535831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=4t12sejmyU2kV4Nm9FvGDfyZiybblS1HJpmNRiAYbps=;
 b=AOO/ROZeWW49cdUxC6ndtiejvzfGZGZ2FjM/NLLJ/HKPnKrH+4inP0CXoBDV1BwD83NOq4
 PodMuvaphC2ruAEpy1Va6BQwx9MwAfCkfe+HFbD87Uh8mzyKqzzRF2rSRrzsEwRVO4iEAJ
 ugPEY0ilC5Ed45cnjNna4P+UYg84/ww=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-YT0SPiUCPQaCBZKR8mcWDQ-1; Wed, 18 Mar 2020 08:34:52 -0400
X-MC-Unique: YT0SPiUCPQaCBZKR8mcWDQ-1
Received: by mail-pj1-f70.google.com with SMTP id np18so1870840pjb.1
 for <samba-technical@lists.samba.org>; Wed, 18 Mar 2020 05:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=H9JwQSVZmuc+r62MfIfvGd/1ZOagh+dkhI3o5D1aeNI=;
 b=KEoBoyffoEfWQcbgjGb8ozL/Va0aRU/OikQxGSOST9da9yN7Q8OkKjAyZ1QtF7pDwi
 QRuacqKY9aF7YrLlfcbSDLfc5twlW2L+UFslyN/uRo3J/yDGhbnW7vevW2kl5eUy/Z+i
 wktp9FjWVSXUxmWHmI0JeFqoo/hPio/IVMwv9WVPgCzUxcBPRplRx9R3VKmeq7hiQWTG
 F9zxk1dk9h0RTFH9/QWwVWVpM5jqPn76kPBTPnurP8Rsj+p0BE4OH1e8SXnt1RnbU9FF
 pojqHxnkJoQ7G6+ROPLiLdIpxrQwG8vp3Qq73BXX+Qsiva8veKqtp4j97teOYyHOCne7
 yxwg==
X-Gm-Message-State: ANhLgQ1Q9sBgymGGVqAJfDnLAvmcCDiR/kdk1qBkvOqLr32VxJ/s5ytT
 bhiSAPMo61WxqKkyesqt3VxxvNLr2cxTuiyG1DvtH9EigNLsycI8Ukm8Yp67bDYI6thF0yYVA1D
 8b4z9xs4me5GJPjWJbr+PU5aQQ0hF
X-Received: by 2002:a17:90a:7309:: with SMTP id
 m9mr4374435pjk.52.1584534891464; 
 Wed, 18 Mar 2020 05:34:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvTc1F/NUitfA3nYiDrW31HYVZjvUXblOxMHwEDi6aoDIBLDYLBw5t4iNZvs1R++FiZaUt7Bg==
X-Received: by 2002:a17:90a:7309:: with SMTP id
 m9mr4374398pjk.52.1584534891135; 
 Wed, 18 Mar 2020 05:34:51 -0700 (PDT)
Received: from amitkuma.pnq.csb ([103.83.215.40])
 by smtp.gmail.com with ESMTPSA id ck11sm2443990pjb.32.2020.03.18.05.34.49
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 05:34:50 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: smbclient(samba-4.10.4) cannot log data in log.smbclient while
 samba-3.6.23 can
Message-ID: <639e0583-ccbf-9fa3-893f-730283c8abb1@redhat.com>
Date: Wed, 18 Mar 2020 18:04:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

smbclient cannot create log file when log-basename is specified in=20
samba-master.

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -l|--log-basename=3Dlogdirectory
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Base director=
y name for log/debug files. The extension=20
".progname" will
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be appended (=
e.g. log.smbclient, log.smbd, etc...). The log=20
file is
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 never removed=
 by the client.

*On samba-4.10.4*:
# smbclient -l /var/log/samba //<samba-server-ip>/<share-name>=C2=A0=C2=A0 =
-U=20
username%password
smb: \> ls
 =C2=A0 .=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 05:34:29 2020
 =C2=A0 ..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Mon Mar=C2=A0 2 06:46:14 2020
 =C2=A0 test1.xml =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 A=C2=A0 9727426=C2=A0 Mon Mar=C2=A0 2=20
06:50:39 2020

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 26699940 blocks of size 1024. 152430=
4 blocks available
smb: \> q
# ls -ltr /var/log/samba
-rw-r--r--. 1 root root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 Mar 18 05:35 =
log.smbclient=20
<<<<<<<<<<<See file size=3D0
#

*samba-3.6.23:
*# smbclient -l /var/log/samba //<samba-server-ip>/<share-name>=C2=A0=C2=A0=
 -U=20
username%password
smb: \> ls
 =C2=A0 .=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 06:41:49 2020
 =C2=A0 ..=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DR=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 06:41:45 2020
 =C2=A0 file-1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0=C2=A0 Wed Mar 18 06:41:49 2020

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 44732 blocks of size 1048576. 36679 =
blocks available
smb: \> q
# ls -ltr /var/log/samba/
-rw-r--r--. 1 root root=C2=A0=C2=A0=C2=A0 242 Mar 18 08:13 log.smbclient <<=
<<<<<Creates=20
the file.


I tried breaking samba-4.10.4 in setup_logging() using gdb but on=20
running gdb "Single stepping until exit from function setup_logging,=20
which has no line number information", maybe its pproblem of gdb ad gcc=20
version mismatch but i am using both latest version.
samba-3.23 breaks perfactly into setup_logging().

I think using git bisect between these versions would be tough as,=20
versions are far apart.

Even there is significant change log handling between two versions. I=20
tried adding the old code back but still no luck.

samba-4.10.4/lib/util/debug.c
void setup_logging(const char *prog_name, enum debug_logtype new_logtype)

{
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debug_init();
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (state.logtype < new_logtype=
) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 state.logtype =3D new_logtype;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (prog_name) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 const char *p =3D strrchr(prog_name, '/');

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (p) {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog_nam=
e =3D p + 1;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 state.prog_name =3D prog_name;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reopen_logs_internal();
 =C2=A0+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (state.logtype =3D=3D DEBUG_FILE=
) {
+#ifdef WITH_SYSLOG
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
//const char *p =3D strrchr_m( prog_name,'/' );
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *=
p =3D "/log.smbclient";
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (p)
+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prog_name =3D p + 1;
+#ifdef LOG_DAEMON
+ openlog( prog_name, LOG_PID, SYSLOG_FACILITY );
+#else
+ /* for old systems that have no facility codes. */
+ openlog( prog_name, LOG_PID );
+#endif
+#endif
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

}
--=20

Thank you,
Amit Kumar

<https://www.redhat.com/en/openshift-4>

