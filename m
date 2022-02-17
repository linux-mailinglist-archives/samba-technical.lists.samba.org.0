Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A560C4BA7D8
	for <lists+samba-technical@lfdr.de>; Thu, 17 Feb 2022 19:14:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OCM4yGlFApcEEJ3i5qqY9RG+Umg2743rfM+3NDplE80=; b=DjSdkxMJUkPjRfhpUTf5DrDPxx
	eZKy6s0chFQV65hg45P9Q5xMcK7Z9yaAlYeDk6+pxz4n8e5GdeKwTBm2KtofkPwetbulIukw8iJOV
	AnRfakslWfTkiG40kFnZPAD2mEQzSCjUubFTbB3Ia+1/w/sBOegK3KjDVPSf3BRTu+DYFCOGHDpPU
	GPkxA9E/lOeNOoPpajwOxAy6wplNXsYlfOkZSlB4Fdoa8ITSm702KPQB0Y2F6Ip7KKfD/+b9tQq+Q
	8zZNJ1rafM+XR8JN9z9KYutnmgnMLHQwJA31+uskwCnJ6JaQK7k0H5n6jHFKXNdnuDyVW5r0LVn+5
	qdMnr7iQ==;
Received: from ip6-localhost ([::1]:42254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nKlHL-009iNT-5g; Thu, 17 Feb 2022 18:13:19 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:57689) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nKlHF-009iNK-Qr
 for samba-technical@lists.samba.org; Thu, 17 Feb 2022 18:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sernet.de; 
 s=20210621-rsa;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OCM4yGlFApcEEJ3i5qqY9RG+Umg2743rfM+3NDplE80=; b=n8LvAXKqgiDW9XDv7u0sjOMf8L
 FhIjfa6H8C7KUEQ1R9doHRzRWX4fDBJ8tczmqN1rWGaiUSEz/fi4x3BjuEXGPe26NRa63VumCErsI
 aBAH7vdcDxSVKHRK1yObBWfRXrWxSDmrHmMWwnkB0DYdbBQyl7oOFOMBTRS8tl5gKXfj0J8KFtUOH
 FAUiwPSt3amZBCAYJB7KlfAs0Vl7GU7FVy0DMbLWOBJpRCoT26GwLxXwUsT+8gi/+VmKDGgjgY8Dw
 aRh/79enL8HXGcGUSrQIblDLJ9CN/y8kHMwzHJNL51M/vdlXfHi4O38OsyokINgGqgUs7+pkY7cV+
 EJjpjQZQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sernet.de; s=20210621-ed25519; h=Content-Transfer-Encoding:Content-Type:
 Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OCM4yGlFApcEEJ3i5qqY9RG+Umg2743rfM+3NDplE80=; b=KZ5Ge002t7XPHO7R9EEkrQYVlK
 aUrUC1Qway8ZUZLWH7Vrq3916zBl3mqXBwBA/m5JkEqAdJVx+ZgzZ4qQzUAg==;
Received: from intern.sernet.de by mail.sernet.de
 with esmtps (Exim Mail Transfer Agent)
 for samba-technical@lists.samba.org
 id 1nKlHF-000135-3V; Thu, 17 Feb 2022 19:13:13 +0100
Received: by intern.sernet.de
 id 1nKlHF-0004Ny-0C; Thu, 17 Feb 2022 19:13:13 +0100
Message-ID: <625be554-b22d-e73f-e18d-6ee2df75d984@sernet.de>
Date: Thu, 17 Feb 2022 19:13:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: samba-technical@lists.samba.org
Content-Language: en-CA
Organization: SerNet GmbH
Subject: smbcacls domain sid issue
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hey,

I think I've detected a bug.

First of all I place a file "file" as Administator on a share which uses 
the acl_xattr vfs module.

# testparm -s --section-name=xattr
[xattr]
         path = /share
         printing = cups
         read only = No
         vfs objects = acl_xattr

The ACLs looks like this:
# samba-tool ntacl get file --as-sddl --service=xattr --use-ntvfs
O:LAG:DUD:(A;;0x001f01ff;;;LA)(A;;0x001200a9;;;DU)(A;;0x001200a9;;;WD)

When I now use the smbcacls tool to set the ACLs again:
# smbcacls --sddl 
-S="O:LAG:DUD:(A;;0x001f01ff;;;LA)(A;;0x001200a9;;;DU)(A;;0x001200a9;;;WD)" 
-UAdministrator%Passw0rd //dm3.temp.test/xattr

the SDDL ACL looks like this:
# samba-tool ntacl get file --as-sddl --service=xattr --use-ntvfs
O:S-1-5-21-3367907150-2849503042-2089288414-500G:S-1-5-21-3367907150-2849503042-2089288414-513D:(A;;0x001200a9;;;WD)(A;;0x001f01ff;;;S-1-5-21-3367907150-2849503042-2089288414-500)(A;;0x001200a9;;;S-1-5-21-3367907150-2849503042-2089288414-513)

Is seems that wrongly the local SID (instead of domain sid) is used here:
# net getdomainsid
SID for local machine DM3 is: S-1-5-21-3367907150-2849503042-2089288414
SID for domain TEMP is: S-1-5-21-4063336984-1021020757-935970304

What do you think? I'm not sure whats the source of the issue. I've 
verified that setting the ACL in the SDDL format via "samba-tool ntacl 
set ..." works fine, so it might be an issue with the smbcacls tool:

# samba-tool ntacl set 
'O:LAG:DUD:(A;;0x001f01ff;;;LA)(A;;0x001200a9;;;DU)(A;;0x001200a9;;;WD)' 
file --service=xattr

# samba-tool ntacl get file --as-sddl --service=xattr --use-ntvfs
O:LAG:DUD:(A;;0x001f01ff;;;LA)(A;;0x001200a9;;;DU)(A;;0x001200a9;;;WD)

Best regards,
Björn

-- 
SerNet GmbH - Bahnhofsallee 1b - 37081 Goettingen
phone: +49.551.370000.0 - web: https://sernet.com
http://www.sernet.com - mailto:contact@sernet.com
AG Goettingen HRB2816, CEO: J.Loxen, CFO: R. Jung
data privacy policy https://www.sernet.de/privacy

