Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774FF1221
	for <lists+samba-technical@lfdr.de>; Wed,  6 Nov 2019 10:26:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=omTEvNoUqHQD3KPhJ3WFq6VWT3bOC+Spfu8+A3INzm0=; b=eMc9HefX4vUedBBW3k2rHVQjXg
	L6SZzvCWkKuaov9cIxXStSHndVw2039HLiaGHBjinnd6iDBvGwmL8lG0G0vh0bHNUUW0728s1eC/7
	nPXJRgyuFK1V17ZaKxEJR974F6GM2PzPPfaXCe8FlRdEcGEe+duxdpjQpPyOkeDfJYZvz0Dpy40Bb
	KOdix5EEMyIpEf74DwSxpqzqxw+PPl2PyRjaeUkR/5xEX5PA3pD9zGTjKnLIKwvbntp3J5dVNW/gk
	L4HoBsQ4rbs8NCC0RlXFVTSAx6UTYX1ecNP9K2XapDSqOgn8QLSdlzhEoBcKCE+tRK6fY9dkDiR0L
	Ds+24G3Q==;
Received: from localhost ([::1]:18042 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSHZy-006zW1-Bu; Wed, 06 Nov 2019 09:26:18 +0000
Received: from [194.107.17.39] (port=58344 helo=air.basealt.ru) 
 by hr1.samba.org with esmtp (Exim) id 1iSHZt-006zV1-Ps
 for samba-technical@lists.samba.org; Wed, 06 Nov 2019 09:26:16 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id CB3ED589B34; Wed,  6 Nov 2019 09:10:04 +0000 (UTC)
Received: from [10.64.128.143] (pppoe-213-80-238-141-fix-srv.volgaline.ru
 [213.80.238.141])
 by air.basealt.ru (Postfix) with ESMTPSA id 45113589B2D
 for <samba-technical@lists.samba.org>; Wed,  6 Nov 2019 09:10:02 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: GPO application in Samba
Message-ID: <80a05da5-3692-8e07-8013-1c4874aba498@basealt.ru>
Date: Wed, 6 Nov 2019 13:10:01 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello!

I'm an ALT Linux maintainer and I'm studying Samba code related to work 
with GPOs. I've read these three presentations:

https://sambaxp.org/fileadmin/user_upload/sambaXP2018-Slides/Mulder-SambaXP-2018_2--klein.pdf
https://download.samba.org/pub/samba/slides/cifs-workshop-2007/CIFS2007-Samba-Group-Policy-engine.pdf
https://www.samba.org/~obnox/presentations/linux-kongress-2008/lk2008-obnox.pdf

and found this information about Group Policy Editor implementation:

https://mytechinsights.wordpress.com/2017/11/27/group-policy-management-console-for-linux/
https://lists.samba.org/archive/samba-technical/2018-March/126534.html

I've also found this MR:

https://gitlab.com/samba-team/samba/merge_requests/32

and at ALT Linux we're developing some ADMX files to allow easier 
integration of ALT Linux into domain:

https://github.com/altlinuxteam/admx-basealt

so it would be nice to standardize the approach.

In the end: I'm too lazy to reinvent the wheel. I would be glad to 
contact David Mulder and other Samba Team members and cooperate in 
development of samba-gpupdate utility, related libraries and Group 
Policy extensions (solibs and Python modules). Also it would be nice if 
I will be able to modify yast-gpmc so it will be able to run in a 
generic distribution, not only SuSE Linux.

I also have a question about intended usage of gpext.conf file in 
python/samba/gpclass.py . I've found no documentation except code about 
this part. Could anybody possibly clarify the purpose of this file?

---
With best regards, Igor Chudov.

