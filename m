Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B272743D12
	for <lists+samba-technical@lfdr.de>; Fri, 30 Jun 2023 15:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xFhvfRj6ksmeR5/Po/n6hxK0n0nyilrSleGAjwcx3KE=; b=EbAod3c4a0F3N2jjN7Zw5DmMHE
	VbsF+icNcZDnsS6B3kFKfdgYA6apN8DAUYfmr5nndcHP9LpttJTui/3ISw6eMecYtF8aQUe2hSo/9
	HX2/P0csZMBduHXbhKs9C7rCcZ2QMi9nchNWs6ZgKt65q6e2g5bxvvKA/QZk/UUaH0YbWVVMzgIoo
	bdsMg5hRfvvrGop5znXz1aLF3rk1/u1Tc7VzE2BSeOoqD46rjjh6DHQh8PnTzLzKjsJtsgOK4JKld
	tkS409kkXY48f1LiAlYteRW9safn3S743nmbJBp7qSKksc8NFDb+n+8+1TEvipl9FZCwHsyZ3CIIP
	9mG1mPYQ==;
Received: from ip6-localhost ([::1]:42302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qFEbk-005Mjm-IT; Fri, 30 Jun 2023 13:56:20 +0000
Received: from lilac.mail.einfra.hu ([2001:738:0:415::6]:43640) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qFEbc-005MjO-BS
 for samba-technical@lists.samba.org; Fri, 30 Jun 2023 13:56:16 +0000
Received: from [2a02:ab88:38c:6f80:3ac:23ce:90c6:6180] (helo=fin)
 by lilac.mail.einfra.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <wferi@niif.hu>)
 id 1qFEbV-00046w-PD; Fri, 30 Jun 2023 15:56:06 +0200
Received: from wferi by fin with local (Exim 4.94.2)
 (envelope-from <wferi@niif.hu>)
 id 1qFEbT-002dgn-Mt; Fri, 30 Jun 2023 15:56:03 +0200
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Is this a real memory leak?
References: <87v8f9gpbo.fsf@fin.soreny> <ZJsgx2j0foTkcE6m@jeremy-rocky-laptop>
 <87y1k2fvkt.fsf@fin.soreny>
 <05888b9585b918c2f14576e884982fb762323133.camel@samba.org>
Date: Fri, 30 Jun 2023 15:56:03 +0200
In-Reply-To: <05888b9585b918c2f14576e884982fb762323133.camel@samba.org>
 (Andrew Bartlett's message of "Thu, 29 Jun 2023 21:56:01 +1200")
Message-ID: <87o7kxf40c.fsf@fin.soreny>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Ferenc_W=C3=A1gner_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Ferenc_W=C3=A1gner?= <wferi@niif.hu>
Cc: wferi@niif.hu, samba-technical@lists.samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andrew Bartlett <abartlet@samba.org> writes:

> On Thu, 2023-06-29 at 11:48 +0200, Ferenc W=C3=A1gner via samba-technical=
 wrote:
>
>>  Jeremy Allison <jra@samba.org> writes:
>>
>>>  On Tue, Jun 27, 2023 at 12:41:15PM +0200, Ferenc W=C3=A1gner via samba=
-technical wrote:
>>>
>>>> [...]
>>>> Do you agree that this patches an actual memory leak?  If so, would you
>>>> please consider taking it?
>>>
>>> Thanks Ferenc, this does look like a real memory leak to me.
>>
>> Thanks for taking the time, Jeremy!  What could I do to get this
>> included in Samba, what's the preferred process for submitting patches?
>
> Ideally https://wiki.samba.org/index.php/Contribute but I suspect we
> may be able to do something less heavyweight.
>
> Do you know Balazs?  I'm not sure we strictly need it for one line,
> but ideally we get a signed-off-by and a developer declaration from
> them.

Hi Andrew,

I don't know Bal=C3=A1zs personally.  Given that the fix is fairly trivial,
what if we consider my email a bug report instead and one of you invents
and commits the fix?  We don't want (and probably couldn't) assert
copyright for that single line of code.
--=20
Thanks,
Feri.

