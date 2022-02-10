Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6F94B054F
	for <lists+samba-technical@lfdr.de>; Thu, 10 Feb 2022 06:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=qfDI3PUxBSvQwQVfwIVeNGN0JfpdLL55a7Y7OPlIQFE=; b=adpKYT3IOunNv/UOZV5hb3D3YZ
	PWM22Fhig1pYhAEpFiDmVchCB6bt2MA6OK9eb+meDTCpISQc5hY7FIJo9qUcc+agnbPMUPK4h1XDl
	8fn3eiuQhPFCOmePC54tTNDeZVgoykJU6wmhOvIjGuaSo2BLiBh5hah4ALvJSfRe9Gtecg4oBQr73
	ePRN1U5m8bKY9sw1/rUrbb6HxIRqBX2Zm5y434sPHcXoHEcudOke/rGGPjs4iea4YQs0IbBmiFQ7f
	AlF67SiTTkYV2IrjRznVjUdPH5ZmGIN3x5mcx6q/zLbc6kRPHtKgDWhSSmIV1SjJ8Nxk/GQt1vu8L
	e0W1GywQ==;
Received: from ip6-localhost ([::1]:22098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nI2Ac-0063xe-Cg; Thu, 10 Feb 2022 05:39:06 +0000
Received: from sender-op-o11.zoho.com.au ([103.138.129.1]:17176) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nI2AU-0063xU-Uy
 for samba-technical@lists.samba.org; Thu, 10 Feb 2022 05:39:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1644471531; cv=none; 
 d=zohomail.com.au; s=zohoarc; 
 b=bP6HjnLRfwiSldAOHZaO4cRImTQSTUtBc1vCBaxdyENlD3FPX9LJ6ozY0LoMnmI2yKjYMP0n8b8VwNK8751kr6Hrw5tbGlf2i9Apx554M70DMGQIQ12w2jL3JrNkxEqM2QwAXc+PiUE4as6y/GXvS7O1ZrUXa04+LQbIVZQGesw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com.au;
 s=zohoarc; t=1644471531;
 h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=qfDI3PUxBSvQwQVfwIVeNGN0JfpdLL55a7Y7OPlIQFE=; 
 b=0SDGuwEwX+44t/+IV1pI/wfwPfjVWKHw06fQB1s+M7+aiB6Rl99wUhlzRWqOMz9oLqus29Sl6KrMsMmK7fKnJV7csmA4eK+G1Rnc619MwSPoNm48t0/Ufv/jDuMxJdfrHC6iCChcKl92q0hldobMNWH69T8drb6HmPcjQf3coiQ=
ARC-Authentication-Results: i=1; mx.zohomail.com.au;
 dkim=pass  header.i=smedley.id.au;
 spf=pass  smtp.mailfrom=paul@smedley.id.au;
 dmarc=pass header.from=<paul@smedley.id.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1644471531; 
 s=zmail; d=smedley.id.au; i=paul@smedley.id.au;
 h=Date:MIME-Version:Subject:To:References:From:Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=qfDI3PUxBSvQwQVfwIVeNGN0JfpdLL55a7Y7OPlIQFE=;
 b=ezN7jficChvtL6+5AwkPbmrZN+DmPlTZAG0OdJDUIdylyUq8vWEXGYkvf5f1PwD+
 iQW2xWj0STpFQYSUN+HVtPmbNISBGKCDJuAngKeqk9BlxW8A0WYsg+psxuIcl1DVlTA
 VrnrKB9I5FGBuntrntbOE8zivuR5+eL055ixRaK4=
Received: from [192.168.1.159] (61-245-148-167.3df594.adl.nbn.aussiebb.net
 [61.245.148.167]) by mx.zoho.com.au
 with SMTPS id 1644471530484802.8741918362801;
 Thu, 10 Feb 2022 16:38:50 +1100 (AEDT)
Date: Thu, 10 Feb 2022 16:08:49 +1030
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Samba on OS/2 derivative ArcaOS
Content-Language: en-AU
To: samba-technical@lists.samba.org
References: <53125588031f8ffad9e7c8a4b16a7f093781a39f.camel@samba.org>
 <28c3b502-7146-4403-b728-4815dafa9110@samba.org>
 <4406c0a37ed78d50bef9d10198fb6e565e633588.camel@samba.org>
 <YgH8F7/VoCe0pUyv@jeremy-acer>
 <9366e519039acf37002ab5f99c9038d378550e4b.camel@samba.org>
 <b77b6916-626f-22cc-2885-80936e76280a@smedley.id.au>
 <4c25d80bbe82276c6738b7d440edb73477254a12.camel@samba.org>
Message-ID: <e260492d-adc9-ffcf-30f3-177666f368f1@smedley.id.au>
In-Reply-To: <4c25d80bbe82276c6738b7d440edb73477254a12.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
From: Paul Smedley via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paul Smedley <paul@smedley.id.au>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Hey Andrew,

On 10/2/22 15:08, Andrew Bartlett via samba-technical wrote:
> On Thu, 2022-02-10 at 08:58 +1030, Paul Smedley via samba-technical
> wrote:
>> Hey Andrew,
>>
>> On 9/2/22 08:44, Andrew Bartlett via samba-technical wrote:
>>> Bj=C3=B6rn, after reading the discussion here is your position still
>>> that we
>>> need to retain LanMan authentication for DOS, OS/2, Win3.11 and
>>> Win9X?
>>
>> I'm not Bj=C3=B6rn, but speaking as someone who has some involvement in
>> ArcaOS (https://www.arcanoae.com/) which is the modern day successor
>> to
>> OS/2, ArcaOS ships a client currently based on Samba 4.11.x so there
>> is
>> a pathway for OS/2 users to update their CIFS.
>=20
> It would be great to get that updated to current Samba, as Samba 4.11
> is out of support.  Is there any particular reason a more modern
> version isn't used?

I had forked the Ubuntu focal code in order to minimise the level of=20
update - but of course - now that code has moved to 4.13.

The ultimate goal is to get a working smbd as well - 4.12 introduced the=20
*at (eg openat, unlinkat) api - which aren't supported by the libc=20
runtime I'm using.

I'm intending to update to at least the 4.13 code now used by Focal asap=20
(at least for the client) - my day job keeps interfering though!

As I recall, the recent security fixes have been file server or AD=20
related - those components aren't currently in ArcaOS - so I don't think=20
the 4.11 client is a major concern -  particular compared to the old IBM=20
Peer client :)

Cheers,

Paul


