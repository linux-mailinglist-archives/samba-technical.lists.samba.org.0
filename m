Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5965F6BD94D
	for <lists+samba-technical@lfdr.de>; Thu, 16 Mar 2023 20:34:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=A0/+ox8ryEGvy9j5Z3mRsD6eFGXwrJFgZfAgGG+Fq+E=; b=AlTUgPtVL3EJHwF4TCxf8Y25hx
	Oo+IBOJhh/F43yq9B+ygmREZUN9NSNKO2vyaRh+jJ+Sqs/4Osdrma/ydMzQNb2iBEArDcjC+CZrcB
	Dbu4MIAuTzQc0CGezEwXmxRWegusaFMQ2yEDW3BdYmrJimAldBmO6zwJB+rXPRfAp9DnXqQ8kZJ7+
	sx5KHppwSWZRdosKyYH2WaPsMoLIobh5bw4NL41ZUsqlhRi9mYgbFl4NO+6fdb1hwuiyKBhO3kjgb
	mhzFQ998JzE6T3Du0RogwsYV6+qQrnOgg+DYz8JjDug0wFhyW2wnzmSiE1BaWVO2aI41c0vT3QB1D
	Ks6A3y3Q==;
Received: from ip6-localhost ([::1]:31916 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pctMi-002sxH-Pt; Thu, 16 Mar 2023 19:34:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18896) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pctMe-002sx8-5a
 for samba-technical@lists.samba.org; Thu, 16 Mar 2023 19:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=A0/+ox8ryEGvy9j5Z3mRsD6eFGXwrJFgZfAgGG+Fq+E=; b=utyCbspEv07KAsTQU649dK5b4G
 LaEYOZTiclvnYjQ7cgJ/07wV7Ez1PPrucJIXnDfAQ9KM1h+dPmU00LaxWVNySMRa5BQtKrh9Reyna
 YCuL3mpEPNge/+AbyA7OEG/1flrNWoJBZ2yB0UFF9LlReOfrdkkLKQOcFAVhgfQmE3lKX/rT9qEXK
 kUzYVLglk9pWFkJFat09UzrNttA/vRFPphm5qw2wpcwMPmbAuTIeVGDM7w7yLimsofToJNYWqOUKI
 O6TvP7hMWVEkBNPs1G3yVilSSoZxGW23GmOPc3O89uhKLMsOoedDSABvDSq264ljL/9m48EAWcJUi
 JfYmay2Z0unmsmgp75LOzHTTs2Krf8JG/qS+FvB6zdZ+/cc77yqiVmgcSj7wPZRj0O3BUuZ453mvP
 dGz/pDP702v343+vLLEexjo9Hf1QgKlYjN7gwDGZraknNoWk7dTuz9UX0RxvSbMpDWN5ukYBIzuwV
 DA3aq8zx03pe6em+BBJurQe/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pctMd-003fuw-En; Thu, 16 Mar 2023 19:34:15 +0000
Message-ID: <88ecdb4e-ed80-889a-dafc-b939ee0cf181@samba.org>
Date: Thu, 16 Mar 2023 20:34:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Nesting of local groups (SID_NAME_ALIAS)
To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>,
 samba-technical@lists.samba.org
References: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
Content-Language: en-US
In-Reply-To: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Pavel,

> windbind does not correctly display members for e.g. BUILTIN/users. It shows nothing:
> 
> ./bin/wbinfo --group-info BUILTIN/users
> BUILTIN/users:x:100001:

This is good as default and should remain being the default,
as "winbind expand groups = 0" is the default.

Maybe "winbind nested groups = yes" is also relevant here, but I'm not sure.

> 
> Given that "BUILTIN\Users" has 1 member "ADDOMAIN\Domain Users", it should instead show:
> 
> ./bin/wbinfo --group-info "ADDOMAIN/domain users"
> ADDOMAIN/domain users:x:100006:ADDOMAIN/joe,ADDOMAIN/jane,ADDOMAIN/samba2008r2$,ADDOMAIN/samba2003$,ADDOMAIN/administrator,ADDOMAIN/krbtgt,ADDOMAIN/testallowed 
> account,ADDOMAIN/testupnspn,ADDOMAIN/testdenied,ADDOMAIN/alice,ADDOMAIN/srv_account,ADDOMAIN/bob

Is this really required? in a huge domain this will likely never finish. and it's also imposible to get right,
as members might be located in a different domain/forest.

So I'm not sure how useful this is.

> I am working on the fix. One part is to call dcerpc_samr_GetMembersInAlias() instead of the wrong dcerpc_samr_GetAliasMembership() in source3/winbindd/winbindd_rpc.c.
> Another part is to change the code dealing with nested groups / aliases. For that, I need to understand if aliases (SID_NAME_ALIAS) can be nested, like groups 
> (SID_NAME_DOM_GRP).
> Reading the Microsoft documentation https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-authsod/597504d8-5408-4629-9d81-aab661e6c953:
> 
> /A local group can contain user accounts that are local to the computer and user accounts and global groups from their own domain./
> 
> It looks that "Local groups" which I believe is BUILTIN/users (SID_NAME_ALIAS) cannot contain another "Local group". I have tested that also on Windows server using 
> lusrmgr.msc and such nesting was not possible.
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


