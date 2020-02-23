Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB781698C6
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 18:05:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UJ7EVdEtcbEtCZZFh7eeuIOfM9kw5Qa24LBeGNuUYSU=; b=Ah7QHZ/Ppx6Bmhu4GIcvHgPBCd
	a3Xetw06c/ndH8/LnvAkB1Pq0Gjt0T/pABrtR14JzMSR1IbLTFOGHclwaOpk8f70PyawV5F2keHmn
	FrpCu2hRyMnoCq99i3/KT0K755WBB5snNf81dKg+VryYm5x7+NabvyK9sWkpJHt8nSyglQmKbs4So
	5AWriYAvQfJ3olLu4l7SeCEI3ET/EKZUBn7XXC/nPV8VWJFJhcU9nBOyPv3RKRYAehXCBJRcJIARp
	YRSprukXGwHhPObE2Gisk7h7zr4i4ArkMyukS/hiY+Hee/yHgiJ6jZzULrLx3T7vVWGPm6ma4HfpV
	MyrJurBQ==;
Received: from localhost ([::1]:34886 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5uh2-00BCs3-LD; Sun, 23 Feb 2020 17:05:24 +0000
Received: from [199.38.86.66] (port=49518 helo=n4.nabble.com) 
 by hr1.samba.org with esmtp (Exim) id 1j5ugr-00BCrv-3O
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 17:05:17 +0000
Received: from n4.nabble.com (localhost [127.0.0.1])
 by n4.nabble.com (Postfix) with ESMTP id 9D4B41101226C
 for <samba-technical@lists.samba.org>; Sun, 23 Feb 2020 10:47:40 -0600 (CST)
Date: Sun, 23 Feb 2020 10:47:40 -0600 (CST)
To: samba-technical@lists.samba.org
Message-ID: <1582476460641-0.post@n4.nabble.com>
Subject: Internal Samba DNS issue with AD
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
From: smalldragoon via samba-technical <samba-technical@lists.samba.org>
Reply-To: smalldragoon <lionel.monchecourt@free.fr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi, 
I guess I'm missing a step ( or something ) setting up the samba as AD.

I use the configure script, asking to use the internal DNS ( and so, not
bind ), but it fails . anyone has insights ? 

here are the install logs : 

Setting up sam.ldb schema
Setting up sam.ldb configuration data
Setting up display specifiers
Modifying display specifiers
Adding users container
Modifying users container
Adding computers container
Modifying computers container
Setting up sam.ldb data
Setting up well known security principals
Setting up sam.ldb users and groups
Setting up self join
Adding DNS accounts
Creating CN=MicrosoftDNS,CN=System,DC=Mydomain,DC=com
Creating DomainDnsZones and ForestDnsZones partitions
Populating DomainDnsZones and ForestDnsZones partitions
Setting up sam.ldb rootDSE marking as synchronized
Fixing provision GUIDs
A Kerberos configuration suitable for Samba AD has been generated at
/var/lib/samba/private/krb5.conf
Setting up fake yp server settings
Once the above files are installed, your Samba AD server will be ready to
use
Server Role:           active directory domain controller
Hostname:              adc1
NetBIOS Domain:        Mydomain
DNS Domain:            Mydomain.com
DOMAIN SID:            S-1-5-21-410183854-368227142-265307538

and when I start the service and check service status : 

root@Mydomain/etc/samba# systemctl status samba-ad-dc.service
? samba-ad-dc.service - Samba AD Daemon
   Loaded: loaded (/lib/systemd/system/samba-ad-dc.service; disabled; vendor
preset: enabled)
   Active: active (running) since Sat 2020-02-22 20:42:02 UTC; 7s ago
     Docs: man:samba(8)
           man:samba(7)
           man:smb.conf(5)
 Main PID: 30610 (samba)
   Status: "smbd: ready to serve connections..."
    Tasks: 23 (limit: 4703)
   CGroup: /system.slice/samba-ad-dc.service
           +-30610 /usr/sbin/samba --foreground --no-process-group
           +-30631 /usr/sbin/samba --foreground --no-process-group
           +-30632 /usr/sbin/samba --foreground --no-process-group
           +-30633 /usr/sbin/samba --foreground --no-process-group
           +-30635 /usr/sbin/samba --foreground --no-process-group
           +-30638 /usr/sbin/samba --foreground --no-process-group
           +-30639 /usr/sbin/samba --foreground --no-process-group
           +-30640 /usr/sbin/smbd -D --option=server role check:inhibit=yes
--foreground
           +-30641 /usr/sbin/samba --foreground --no-process-group
           +-30642 /usr/sbin/samba --foreground --no-process-group
           +-30643 /usr/sbin/samba --foreground --no-process-group
           +-30644 /usr/sbin/samba --foreground --no-process-group
           +-30646 /usr/sbin/samba --foreground --no-process-group
           +-30647 /usr/sbin/samba --foreground --no-process-group
           +-30648 /usr/sbin/winbindd -D --option=server role
check:inhibit=yes --foreground
           +-30649 /usr/sbin/samba --foreground --no-process-group
           +-30650 /usr/sbin/samba --foreground --no-process-group
           +-30651 /usr/sbin/samba --foreground --no-process-group
           +-30658 /usr/sbin/smbd -D --option=server role check:inhibit=yes
--foreground
           +-30659 /usr/sbin/smbd -D --option=server role check:inhibit=yes
--foreground
           +-30661 /usr/sbin/winbindd -D --option=server role
check:inhibit=yes --foreground
           +-30663 /usr/sbin/winbindd -D --option=server role
check:inhibit=yes --foreground
           +-30664 /usr/sbin/smbd -D --option=server role check:inhibit=yes
--foreground

Feb 22 20:42:04 adc1 samba[30650]: [2020/02/22 20:42:04.153186,  0]
../lib/util/util_runcmd.c:327(samba_runcmd_io_handler)
Feb 22 20:42:04 adc1 samba[30650]:   /usr/sbin/samba_dnsupdate:   File
"/usr/lib/python2.7/dist-packages/samba/netcmd/__init__.py", line 176, in
_run
Feb 22 20:42:04 adc1 samba[30650]: [2020/02/22 20:42:04.153214,  0]
../lib/util/util_runcmd.c:327(samba_runcmd_io_handler)
Feb 22 20:42:04 adc1 samba[30650]:   /usr/sbin/samba_dnsupdate:     return
self.run(*args, **kwargs)
Feb 22 20:42:04 adc1 samba[30650]: [2020/02/22 20:42:04.153232,  0]
../lib/util/util_runcmd.c:327(samba_runcmd_io_handler)
Feb 22 20:42:04 adc1 samba[30650]:   /usr/sbin/samba_dnsupdate:   File
"/usr/lib/python2.7/dist-packages/samba/netcmd/dns.py", line 940, in run
Feb 22 20:42:04 adc1 samba[30650]: [2020/02/22 20:42:04.153308,  0]
../lib/util/util_runcmd.c:327(samba_runcmd_io_handler)
Feb 22 20:42:04 adc1 samba[30650]:   /usr/sbin/samba_dnsupdate:     raise e
Feb 22 20:42:04 adc1 samba[30650]: [2020/02/22 20:42:04.167908,  0]
../source4/dsdb/dns/dns_update.c:290(dnsupdate_nameupdate_done)
Feb 22 20:42:04 adc1 samba[30650]:   ../source4/dsdb/dns/dns_update.c:290:
Failed DNS update - with error code 29

no response of a dns srver on 127.0.0.1
I'm on ubuntu 18.04 ( bionic )
Thanks a lot



--
Sent from: http://samba.2283325.n4.nabble.com/Samba-samba-technical-f2457555.html

