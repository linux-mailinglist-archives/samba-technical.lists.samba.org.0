Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4F84D22E
	for <lists+samba-technical@lfdr.de>; Wed,  7 Feb 2024 20:18:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=OsO7YvKUevQzQedcFrdjYW5VJcWOKtSeloQ6gbddh8Q=; b=PXM8Giz5388hsz+KH+V6pnYjPh
	+HbTa3u+7X3dsLr8uzJqKFvrXsT5FOjCGfmpabSVUbVPmS5TUMrQt/qeejb6F/Jp4e9g3tOqTKXC+
	kJR8hJ7auUTlMGk3DSYJZiZVN4k8bG6FAqPT9j1/VFXNM4LQov11nUKaYMArlHq5Z8GApgw1CkLIY
	vpFtMcAbkLHwE+Q0gxNE3iZBOCMsG68/4YDw2nkBzkn17l7qas8qEf6SmJoPbkG9cnk+NOpOQU8EI
	oOntaqm098tYhbDifQz6KA0aLLrA2F8YZacozboQLQEjg9quu+5u7mxQ9WNQ00sf7wC7aV+oVxQdZ
	w6Zd9HuQ==;
Received: from ip6-localhost ([::1]:52982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rXnR0-007otT-M4; Wed, 07 Feb 2024 19:18:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17012) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rXnQw-007otM-4E
 for samba-technical@lists.samba.org; Wed, 07 Feb 2024 19:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=BHjDpnBK4YDU7R88/Z0cWoL95yZnL4metagrFlG46YA=; b=nM0EiO/+KJ+aK2lhyltDdcuLdV
 vA0KHgbFiahK9sJhqQebTDaC2Z7+brgeX97o+/FUdD1zI/+X9aK1sP2BhEE8h2GM65c+OfG/Pktv/
 GxV9wDhhu50oyGkx2u8uwzof7xaSTtryjj0gkI4GrFV3aDcv23DBQb2jAivTYlDleAvJjgv73rHwM
 z8jRVA0kfBfocbuWd5vjFVCOvtHNhFv9HbMU0X3TcnvZ6neYifSR6f2T6sS8r6h6YDJSRzCmgdNw8
 XULsVsBCPgzc43Ai03hRxkRro8t5EuofIHZs5KaBwoVjYolUitynfgZZ/k+SPqfJkNQqJlx2dJ15Y
 9RC6O3UOMxVkCeJYESjjA+ITZxe4mL7eBC6E2m38LJaKHYg2k5bMdnDR93oFS15IrY4uRvQij9wJY
 exfCtQLgYf1U3PeAoolTm9D8WETx8berPrVFBmoMjivtWqDDdqGgFFP5bI7VXHxFeYgY/xgZ3VubD
 /l76dE23j3rUTIEM9tWHYK+j;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rXnQv-00C0JE-1P for samba-technical@lists.samba.org;
 Wed, 07 Feb 2024 19:18:09 +0000
Message-ID: <6857ffbf-2189-4215-4748-88a9eee434a5@samba.org>
Date: Wed, 7 Feb 2024 12:17:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: default value for "winbind separator"
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <c478c72b-d7ab-4d7f-bb38-94e309b1a42e@kania-online.de>
In-Reply-To: <c478c72b-d7ab-4d7f-bb38-94e309b1a42e@kania-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 2/7/24 12:13 PM, Stefan Kania via samba-technical wrote:
> Hello,
>
> up this point I never ever used or noticed the default setting of the 
> "winbind separator" I only know that it was "+" in the early days of 
> Samba. Now that I tried to get GPOs (for smb_conf) running on a DC the 
> following was happend:
>
> I created the GPO, linked the gpo and then did a "samba-gpupdate 
> --force" that changes my smb.conf in that way, that all possible 
> options were written into my smb.conf. Including "winbind separator = \"
I'll point out the fact that all possible options were written to the 
smb.conf is a bug in the *s3* loadparm. The smb.conf group policy 
extension is just calling `lp.dump(show_defaults=False, filename)`, 
which should not dump every option.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com
