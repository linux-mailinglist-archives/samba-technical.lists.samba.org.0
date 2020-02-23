Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 349D116980F
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 15:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=bHZB20JCojvC9AoLYKbDTdSEvF2pcJlBfdW1xfFyhm8=; b=m/yVq9SItbmoKw+6Yhlk34xZwC
	iiWViZpU+xcl0NzZC5U/+dRiG16H3pq0hja2bDiWp0JHY4N1buDowxKQCdPXFgKrXy6W5wR05nSmb
	cRjC6oz6W1CQSVIaxpGfRSMfxP1V8muQQc6rxwHSb1h0yYK8vghMt+ODD7XGupQJgaxxF74lYmfAV
	Lu2XaZKOlzTNU7Q+URRAV8nh98jiB44heJFwQA3fBHj3nZZUL/LT9/oO2JjYzaRdb4qNGuEWyIQHb
	qIaqh3/K7tgQbn/wbbPkIF6kPE/DwG+EXm7ZLjaYbJSgZ3/z3Ruatqclif5iZqrdmoGxKGjzIO+bX
	dBAuYMNQ==;
Received: from localhost ([::1]:27654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5sBB-00BBSr-Bh; Sun, 23 Feb 2020 14:24:21 +0000
Received: from youngberry.canonical.com ([91.189.89.112]:36241) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j5sB5-00BBSk-Sn
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 14:24:18 +0000
Received: from mail-ot1-f71.google.com ([209.85.210.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.hasenack@canonical.com>) id 1j5rtk-00011p-I6
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 14:06:20 +0000
Received: by mail-ot1-f71.google.com with SMTP id a20so4451264otl.11
 for <samba-technical@lists.samba.org>; Sun, 23 Feb 2020 06:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bHZB20JCojvC9AoLYKbDTdSEvF2pcJlBfdW1xfFyhm8=;
 b=O1UFEWrNcGnYmAFqt6gywfXfkltRcz3k+cXAA/OLvMHDBfSPfzr4n5wKwik1Lj/7hy
 T4LBWp4U8G78uqYeY2PbFyDT0qE5YCrH4PSPWArNn+UswdYo2sLJH+uu5urOJ/M1tp7p
 9Rf1HjaR8zej/9uK0SZTiHWf8oa2QVPry2V0qGISdWowBHUws0T0ptkfS5cGPegzRUUd
 4JbhYCZPBpL0yZ8YXGqjciiGXZMqpRkWkTzTZnsA6ChB44D7lZOzEiq+ei/mC0YQpF0N
 v78FCiH6raOQ2USglAeiOqVv19vbYbEOdTOv/UrlOuW6ypU+zZ0sYmLTSofBhZKmFvD+
 zR1g==
X-Gm-Message-State: APjAAAWrFNlxJvyjonm1c8Oam6bPpi79lChqaMBHtZOBrfQzD/477Dc3
 NgSzBMU08DEIFqEY3f8Yad0sjSVvAGjWeA7abrnYgh+Icr7WrzIFHTfefj+0IWj5u9xELt4pruN
 DCcT8al6aoTtDQC65u5dp5A7SUaZw48ogFDZidn2zXtDbSyCmSQoiYdOhS+qJ5w==
X-Received: by 2002:a9d:1c96:: with SMTP id l22mr36989213ota.322.1582466779325; 
 Sun, 23 Feb 2020 06:06:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyaQDZQOoSTZ3C8Uf/IjuhBqL9OUM173g6XEk7kp3vXLfp9s0opvs/DCiRm0ZUTHALKepzoSfc4eBh7o5PS7Fk=
X-Received: by 2002:a9d:1c96:: with SMTP id l22mr36989193ota.322.1582466778988; 
 Sun, 23 Feb 2020 06:06:18 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 23 Feb 2020 11:06:08 -0300
Message-ID: <CANYNYEF_9x1tWBehG6BvHEXs_59YR0B_2Mnfxw-mWAz8Tps-Jw@mail.gmail.com>
Subject: samba-tool testparm and netbios name length: error or warning?
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I just came across this different behavior between testparm(1) and
samba-tool testparm:

$ testparm
Load smb config files from /etc/samba/smb.conf
Loaded services file OK.
WARNING: The 'netbios name' is too long (max. 15 chars).
...
$ echo $?
0

But:
$ samba-tool testparm
INFO 2020-02-22 21:16:42,905 pid:37370
/usr/lib/python3/dist-packages/samba/netcmd/testparm.py #96: Loaded
smb config files from /etc/samba/smb.conf
INFO 2020-02-22 21:16:42,905 pid:37370
/usr/lib/python3/dist-packages/samba/netcmd/testparm.py #97: Loaded
services file OK.
ERROR 2020-02-22 21:16:42,905 pid:37370
/usr/lib/python3/dist-packages/samba/netcmd/testparm.py #124: netbios
name FOCAL-BIND9-UPGRADE-TEST is not a valid netbios name
Press enter to see a dump of your service definitions
(...)
ERROR: Invalid smb.conf
$ echo $?
255

I noticed that nmbd just truncates the name to 15 chars and starts up
fine. Should this issue be a warning (like testparm(1) treats it), or
a fatal error, like samba-tool's testparm behavior?

A second question, and that is more of packaging and this might be the
wrong audience, but Debian/Ubuntu use "samba-tool testparm" to check
the config when the role is "active directory domain controller". Is
the netbios name length more critical in that scenario, and thus the
service should really fail hard to start?

I was thinking about patching samba-tool testparm to treat the over
length of the netbios name as just a warning, and exit 0 instead of
255 in that case, but wanted to get more opinions about this since I
rarely setup samba in that AD role.

