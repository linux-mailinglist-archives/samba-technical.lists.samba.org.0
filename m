Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33963295B59
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 11:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=am4ZNsJqdV3Ul1Lnn7j/3NnZuGcSrcuQhgUXs5GKU8Y=; b=NlCLzrPrQeuXu+dwpqZ8Aizhiv
	rDuf/lnvyTUiCBp0gnVs8tFhfNztx/hz4pMYovX8iXjdxx9tWQZnH4SJliLQT99fHU5X6qJDo68jE
	fTLnbVrDZITKvuAga8heaRtBBfoQXg2aUGBtJyfcEhjAZLmItCU55bx1OWLhlAufGdlchzec1PB84
	0HW5+Y06t1Eug3GKvsNCbO1cYTXVfjzA16HaLcLsnKdKhQktCKamtrGdWlo8o5t9ExoaknL5mn9zJ
	dh4MB53r3COn/EDSClMvrcKFn8zvAvNzyPHx8Srud2ArWPdxtRW3EiyGuOw5qGCoVxSbwsEr1FiWo
	LfmQ7XKg==;
Received: from ip6-localhost ([::1]:37988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVWY7-00DFCl-Pg; Thu, 22 Oct 2020 09:06:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVWY3-00DFCd-VD
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 09:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=XsZlm0r+h8VWl7ubpYmNXneeHxSxjweeeTykw8nq6z4=; b=fJ8uV37Zv6z8ZmPcHn+HiUR/f+
 aSv7QD6GHQt3Vlsy/WVWr8/MY0PSjAvDlw3rkiMYoFC/Gu1q+6rl1vhrQ7OJ02cBmNWbCg+/wGe7R
 SLDuN82G0K6LVoY9DLY1jv+gaUNds0ZD6pmIWnW2pXA74yFAZwx4bngijV76X5NX609XifNWZPN56
 1X7Q6dEdtrqzsyW3y7U7Jv0M0wy0tyiG+6ELURdyoLkxZpGIUbdL7jBO/AOX2s7wRm+gQzHaOggr1
 eayOJJcArcSZOatoh88M98UO16Zoexw5bgujUzc8O/m4cZ4A41yEJ9yTtehnpaR/oadJFUEh4TFKv
 0IoFfuRmZCcEagC05vHMd2PF4p/BW2oUqXsXt21FRfq7ez5rqaJo08R+iy/psCfN7KHqGREIHerc9
 7WuOiiSLzknPSfJNCtxw7NshUEluw9c4MlhN2LEYhYiQ8Wq0RnaRoFlc9+TUicLHUVzBTkFbUoqYl
 3A4+YgregiDo0hiPlZ0RijDi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kVWY3-0007w9-Jt
 for samba-technical@lists.samba.org; Thu, 22 Oct 2020 09:06:15 +0000
To: <samba-technical@lists.samba.org>
Subject: 4.12 -> 4.13 upgrade 
Date: Thu, 22 Oct 2020 11:06:15 +0200
Message-ID: <5E76D2F9CEBD40A2BAADFE3EAB53360F@rotterdam.bazuin.nl>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AdaoUpgM0CVKf/lnSpGshSbtt2pZsQ==
X-MimeOLE: Produced By Microsoft MimeOLE
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>










Hai, 














Small question, i cant find this. 



So after the 4.13.0 (on
release date) I upgrade a DC and that failed. so i reverted back to my VM
snapshot. 







I
now see the following in the logs. 








[2020/10/22 10:48:36.514438,
 0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)


 /usr/sbin/samba_dnsupdate: /usr/sbin/samba_dnsupdate:274:
DeprecationWarning: please use dns.resolver.Resolver.resolve() instead

[2020/10/22 10:48:36.521212,
 0] ../../lib/util/util_runcmd.c:352(samba_runcmd_io_handler)


 /usr/sbin/samba_dnsupdate:

 return resolver.query(name, name_type)








Now, when i
look at DC2, which stayed at 4.12.8, that one is not showing any
DeprecationWarnings. 

And i recently added a 3th DC with 4.12.8 and same no DeprecationWarning. 



Im trying to find why only DC1 has this message even after the i reverted to
the VM backup. 



So i hoped today that after the fix for 4.13 for the start up, i did an
upgrade again on my production DC1, having the DeprecationWarning message






Only that didnt solve it. Its all running fine thats not the problem. 



Strange thing here is, DC2
is a copy of DC1 and doesnt show this and same for the new DC setup. 

Anyone suggestions
 what this is, and maybe how to make the error disapear? 

Its a very constant message since i see it every 10 minuts. 



smb.conf only had : 






 server services = -dns -spoolss



Im open for suggestions, since i havent found any messages on this in
bugzilla. 

i searched for "dns.resolver.Resolver.resolve"









Thanks in advance! 










Greetz, 














Louis



























