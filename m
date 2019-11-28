Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1F10CE89
	for <lists+samba-technical@lfdr.de>; Thu, 28 Nov 2019 19:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=eya9Cc2DDcEFFRcn2Vfy3Mw8nV6CUNA9x2yXlQi4H3M=; b=EhnAwO2XJTZIhw+ur2M5L5gtxt
	mKi5Ki0w5VSuUKhugrY2O4gPEbpqCnwQoTCejXMI6t9DaMUjHmoZMBBegx/dbCfZNcD5SZFdHR1G7
	vRtOnN+m8gX9lbXAnlWEUMP3iElPfR49Hq51Z3SuTap9FrBiD+0kuhpTXqgY6tzF+g6Vx+d5ctI4P
	q1TQgHsc6fXxP5626f3SyuxZ7kHscUddwzHAvyP95cPMH0UnoqidzDamKEhLNrhEJew2t7D5zZqL6
	7V6/deYxcgnAOrKzILs7MfMJOrXCojxOFEPyMAbGlK4ZZtkZ87eI5hOqs2L8c2skOFCXtGr5pqrI0
	0xR0vwUA==;
Received: from localhost ([::1]:31698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iaOVS-0034ML-8t; Thu, 28 Nov 2019 18:27:10 +0000
Received: from youngberry.canonical.com ([91.189.89.112]:39639) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iaOVN-0034ME-F0
 for samba-technical@lists.samba.org; Thu, 28 Nov 2019 18:27:07 +0000
Received: from mail-oi1-f199.google.com ([209.85.167.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.hasenack@canonical.com>) id 1iaOGX-0001P5-H8
 for samba-technical@lists.samba.org; Thu, 28 Nov 2019 18:11:45 +0000
Received: by mail-oi1-f199.google.com with SMTP id r206so13131466oih.6
 for <samba-technical@lists.samba.org>; Thu, 28 Nov 2019 10:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eya9Cc2DDcEFFRcn2Vfy3Mw8nV6CUNA9x2yXlQi4H3M=;
 b=lw7yvnlJMz3PU/78tTqkO22DjU1f/Znlz8Zdgg1y8t6DjSRL+GzLr++G4MKQPHF7NX
 TXHB3ZS10KeI7YhfmRkCN0KS5opfLo2RZrjvO3yeLAODHqiEpkkz0sW+huC4aFEYxBrn
 2/aGlTipGXOyfjfBU7ya7P56J1WGTM5CGrM0iXWVsW+qe3fVK14OIQOVHqmx+Cdp8+x9
 PW/6fAKAylX+B/fBkDQqBFKpqGVP42TMtqw3JSS7Ay+mnt0/dF29tI2UwqRw+oGxyjnH
 2E+5PhVz7veHZiGjnxIJ/d5MFn32vmLUxIqiKT46Vbw9zueiHOkTPN2x9E1I9ktg8xsp
 1R+A==
X-Gm-Message-State: APjAAAUdEWg9oVsm3UrSRTlcg660P3PH1NtvywG4ZWuqA2gFfyzpBWax
 HOl4dI8aGfZ1Rdbto8fSy1hs3rXMRTFQFtbZHswHmKlQKmz9+q+77k8lWfkUzPRoxxNVj4uXA9i
 oi8QeGzxjoOwcPbfjuSmW2Dh+rGzmG4vSTTgqkmU4XWN+sXWRORaIl9ADfX34XA==
X-Received: by 2002:a9d:62d2:: with SMTP id z18mr8245246otk.108.1574964704252; 
 Thu, 28 Nov 2019 10:11:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjzmJ5wmo/qfD/4TcvVJ6oPugs2zX5jRsSBqXRMRF0euwlIHWZ27ZjVKuLAgtGgxHOFUEpKDnzJEgph0ZLKpE=
X-Received: by 2002:a9d:62d2:: with SMTP id z18mr8245234otk.108.1574964703919; 
 Thu, 28 Nov 2019 10:11:43 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 28 Nov 2019 15:11:33 -0300
Message-ID: <CANYNYEEyavNVwax-aWu+qLZYMw+f=hFNA=6WH2gREh9WjHQ8oQ@mail.gmail.com>
Subject: smbspool without authentication no longer works?
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

is smbspool supposed to work without authentication, in the case the
printer is shared like that?

I've been tracking some bug reports about printing no longer working
with samba 4.8 or higher. The last one where I got this command below
to work was 4.7.6:

ubuntu@bionic-smb-printer:~$ /usr/lib/cups/backend/smb
smb://10.10.1.6/ds216laser 34 root page 1 options .bashrc;echo
Kerberos auth with 'root@WORKGROUP' (WORKGROUP\root) to access
'10.10.1.6' not possible
ERROR: Session setup failed: NT_STATUS_ACCESS_DENIED
DEBUG: get_exit_code(cli=0x561bb8db7d70,
nt_status=NT_STATUS_ACCESS_DENIED [c0000022])
ATTR: auth-info-required=negotiate
DEBUG: Connected with NTLMSSP...

ubuntu@bionic-smb-printer:~$ echo $?
0

With, say, 4.10.7, I get:
root@nsnx:~# /usr/lib/cups/backend/smb smb://10.10.1.6/ds216laser 34
root page 1 options .bashrc; r=$?;echo;echo $r
kerberos_ccache_is_valid: Failed to get default principal from ccache:
FILE:/tmp/krb5cc_0
DEBUG: This backend requires credentials!
DEBUG: get_exit_code(nt_status=NT_STATUS_ACCESS_DENIED [c0000022])
ATTR: auth-info-required=none
DEBUG: Unable to connect to CIFS host: NT_STATUS_ACCESS_DENIED
2

If I pass "anonymous" as the username, or even a blank space (!), then it works:
root@nsnx:~# /usr/lib/cups/backend/smb smb://\ @10.10.1.6/ds216laser
34 root page 1 options .bashrc; r=$?;echo;echo $r
DEBUG: SMB connection established.

0


I found several bug reports, but none seems to address this issue
exactly. Some were about printing with kerberos.
https://bugzilla.samba.org/show_bug.cgi?id=13832
https://bugzilla.samba.org/show_bug.cgi?id=13939
https://bugzilla.samba.org/show_bug.cgi?id=13970
https://bugzilla.redhat.com/show_bug.cgi?id=1700791
https://bugzilla.redhat.com/show_bug.cgi?id=1706090

