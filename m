Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E9188595F0
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 10:21:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=xXnTMAwBOkH16B+ApR213dd8eBfGespxwTSR3TlkX/Y=; b=ilyvVt/g/qe19W35k/3qX1TVwL
	v3RY7ZWcHbc4JU6wrLshaRLe0mgAPNJjvK5RtfH8+7Ej8jJMyhRt4B+3Cp53Jrm3hJ3qYGfn7gpZe
	r7vkwyTz76+2MOUyl7GpoPGu/hR5yTkm24/YBeq7s5wSGoUb2GW9y/MopD9Zwb1rv3hE2+cZhPkbq
	RJF/JF/JGdCQZcvTttFvJ9Q1TMcV9nz0M21ZE8hlpYYbbJoROyQrHKBUSXO+ZqpBqEVhTo8yR+sq1
	0cI3KkmnEpJMvdGvciOhY0wisk6dCyzXB+mdKsofhxffXZjRFw97OJdi8tpRGBdYIVlwz9Ew+qgI8
	GhUKLl5w==;
Received: from localhost ([::1]:19000 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgm7b-002Hj4-GZ; Fri, 28 Jun 2019 08:20:40 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]:43140) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgm7W-002Hix-Az
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 08:20:36 +0000
Received: by mail-wr1-f47.google.com with SMTP id p13so5272283wru.10
 for <samba-technical@lists.samba.org>; Fri, 28 Jun 2019 01:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=Sc43PiXqJiOFmf8r/xaZxlplaMSlh/9pIEXtES0C8pI=;
 b=UT6zoRJFBoFFC/Zuy+NDb2wCcOl0tS/Z4V5SXT1NWa2KNtkj7Ekk3VnMqAJHVNCigT
 YFYKYdE36FAsT/ipTsBworVYaoppcQfUcofsk3PjJWqL43jPXmGqZGnywch+HCvAWKVN
 hZ4JHUDXsEl9G06+D90YqebEQXwMO2BNZ3ObOa+jky7iPodhlnEzQw2Kf4pKMDsiNz0u
 JnLPH2hT1QyT1GAc544tV+ZRtRnYWN2ldzL5sBDMtLqPenyH9krsPpYwfHMmZckGK2o2
 o3klQGzW/XaRu1OP8bg0z9697NPepPJ6yyjRNQdvN8WUvOeomXlntCg52/slO5geVpYN
 +wCg==
X-Gm-Message-State: APjAAAXTCNO61/RdPeUwrQKImfYQMw1Qf+AesI+Z6fs1s5qW2AST6oJ7
 AQNJijNJo+XAxy2Vo6D28ExNASwy+8Q=
X-Google-Smtp-Source: APXvYqwmJlWq4Ou4f/07eTIzNH7TqcrCpt8macqkdsK1z2QgRFTcpx1BZN1Mv0zPgQWnRghiel+4cA==
X-Received: by 2002:a5d:400f:: with SMTP id n15mr7073210wrp.312.1561710033510; 
 Fri, 28 Jun 2019 01:20:33 -0700 (PDT)
Received: from amitkuma.pnq.csb ([103.83.215.66])
 by smtp.gmail.com with ESMTPSA id g2sm1308006wmh.0.2019.06.28.01.20.31
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Jun 2019 01:20:33 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: Pipeline failing on samba-ad-dc-backup
 [https://gitlab.com/amitkuma/samba/-/jobs/241734878]
Message-ID: <ce517e87-73cb-e018-5d66-9eb8b21a350c@redhat.com>
Date: Fri, 28 Jun 2019 13:50:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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

Not able to find why pipeline is failing

test failed in 42 minutes, while runner timeout is 3h.

==> /builds/amitkuma/samba/samba-ad-dc-backup.stderr <==
make: *** [test] Error 1
samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
TESTS='--include-env=backupfromdc --include-env=restoredc
--include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
--include-env=ad_dc_backup'' with status 2
waiting for tail to flush
Running: 'uname -a' in '.'
Running: 'lsb_release -a' in '.'
No LSB modules are available.
Running: 'free' in '.'
Running: 'mount' in '.'
Running: 'cat /proc/cpuinfo' in '.'
Running: 'cc --version' in '.'
Running: 'df -m .' in '.'
Running: 'df -m /tmp/samba-testbase/b22' in '.'


####################################################################

AUTOBUILD FAILURE

Your autobuild[master] on runner-fa6cab46-project-10891704-concurrent-0
failed after 38.6 minutes
when trying to test samba-ad-dc-backup with the following error:

   samba-ad-dc-backup: [test] failed 'make test FAIL_IMMEDIATELY=1
TESTS='--include-env=backupfromdc --include-env=restoredc
--include-env=renamedc --include-env=offlinebackupdc --include-env=labdc
--include-env=ad_dc_backup'' with status 2

the autobuild has been abandoned. Please fix the error and resubmit.

####################################################################


Though this is a very simple addition of print statement only:

if gplink.strip() == '':
+ print("gpLink is empty")
return ret

Thanks
Amit


