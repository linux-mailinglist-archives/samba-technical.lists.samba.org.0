Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB96BD983
	for <lists+samba-technical@lfdr.de>; Thu, 16 Mar 2023 20:48:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=d9+jS+iSC9ytgU9+Wdvb+wHTi98jEMZEpozUU4qQdeo=; b=LObXom/4zCLpupjmInsQGRt8dZ
	/jE0OewT3Rdhm0guw+7JBgjmy/lpMbM2HRbIkyBUdH09lz0ZNy0OSNAwS4BFr0P+vpBIBxpvotLDT
	0QyNKFNd6c7sMxFnctktmCqi5vSiLGmwWwToabeigi6UPt/zXqwPV62zQNc5T2uouJsjKbnryxwKm
	4SQPqyMsaIzyZJHMabsmqUTp1Lj02xyBqVmunORfudVzFEBBE6d2syReTiCmPYjKeYcePBf+QAyr1
	N/b+bpoxuHAXWyj8Nw6nXDeus+SJr574was+vOIBpaLTZC4zB5n9XefV/rlgGmg/c3zAigD19JGz2
	lXG5rhlA==;
Received: from ip6-localhost ([::1]:46734 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pctZt-002tFQ-0Z; Thu, 16 Mar 2023 19:47:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25372) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pctZo-002tFH-LR
 for samba-technical@lists.samba.org; Thu, 16 Mar 2023 19:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=d9+jS+iSC9ytgU9+Wdvb+wHTi98jEMZEpozUU4qQdeo=; b=UDdldP/Mw1/E0EUBmKe9+qtR39
 aqcMJ6/fOz7EMe0vVK0+x7a7RMY7zof40ynUFJyiWBjz9zT9xXu4TMkfFntbcN4yznC6hsa76gnih
 ImuuI6UPVVEot5LSZa4yvmrdPcVg8caZDyBSep/U3rXtOS0FgH58VeeuqohiaqMVZE2G9Rm2WmmJz
 i3iirK9VNAyZ0OX5E7Zg4DSJJ0P3VoGIQosE566vHil4LEiC4s41YbCZthbyH9Rf+EIl9fBQ0oBCP
 3AbEAvu8wlECsI4dPiYNqRn4tm5EMNa5Oq5AAxaGlPDaSeOcnJUSIDfslo9fDiRZqdUC1faJFPSsG
 yvilNvSr6fwaO+k6d4Qp+A60bJ3WnUWQgegvsSbEEYFq1PJB1SuxhyXihi/l63NMg4P8G+erjH2lL
 97WgcNxBpPYl3x0C3gHqSuJltPGYrtiWFf8ck6z9y5845llU7RS9fCBqaMXIMOfNHGCdzckg+3dGU
 II03CYbpCAtMcR1ftQUxjo/p;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pctZn-003g4h-Tq
 for samba-technical@lists.samba.org; Thu, 16 Mar 2023 19:47:52 +0000
Message-ID: <d6cc1768-ebf7-24ec-bdd7-efc28fe364c9@samba.org>
Date: Thu, 16 Mar 2023 19:47:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Nesting of local groups (SID_NAME_ALIAS)
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
In-Reply-To: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 16/03/2023 19:20, Pavel Filipenský via samba-technical wrote:
> Hi,
> 
> windbind does not correctly display members for e.g. BUILTIN/users. It 
> shows nothing:
> 
> ./bin/wbinfo --group-info BUILTIN/users
> BUILTIN/users:x:100001:
> 
> 
> Given that "BUILTIN\Users" has 1 member "ADDOMAIN\Domain Users", it 
> should instead show:
> 
> ./bin/wbinfo --group-info "ADDOMAIN/domain users"
> ADDOMAIN/domain 
> users:x:100006:ADDOMAIN/joe,ADDOMAIN/jane,ADDOMAIN/samba2008r2$,ADDOMAIN/samba2003$,ADDOMAIN/administrator,ADDOMAIN/krbtgt,ADDOMAIN/testallowed account,ADDOMAIN/testupnspn,ADDOMAIN/testdenied,ADDOMAIN/alice,ADDOMAIN/srv_account,ADDOMAIN/bob
> 
> 
> I am working on the fix. One part is to call 
> dcerpc_samr_GetMembersInAlias() instead of the wrong 
> dcerpc_samr_GetAliasMembership() in source3/winbindd/winbindd_rpc.c.
> Another part is to change the code dealing with nested groups / aliases. 
> For that, I need to understand if aliases (SID_NAME_ALIAS) can be 
> nested, like groups (SID_NAME_DOM_GRP).
> Reading the Microsoft documentation 
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-authsod/597504d8-5408-4629-9d81-aab661e6c953:
> 
> /A local group can contain user accounts that are local to the computer 
> and user accounts and global groups from their own domain./
> 
> It looks that "Local groups" which I believe is BUILTIN/users 
> (SID_NAME_ALIAS) cannot contain another "Local group". I have tested 
> that also on Windows server using lusrmgr.msc and such nesting was not 
> possible.
> 
> However, samba server allows such nesting:
> 
> bin/net sam createlocalgroup TestGroup1
> bin/net sam createlocalgroup TestGroup2
> bin/net sam addmem TestGroup1 TestGroup2
> 
> 
> Can I assume that SID_NAME_ALIAS cannot be nested?
> 
> 
> Best regards,
> Pavel

My understanding of the BUILTIN groups is that they do contain 'local 
groups', but that is 'local' to the domain, not the computer, or have I 
misunderstood something.
There is also the point that I have never used BUILTIN\users and never 
missed it.
What is your use case for this ?

Rowland

