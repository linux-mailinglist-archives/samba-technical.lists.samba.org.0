Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62D523BA3
	for <lists+samba-technical@lfdr.de>; Wed, 11 May 2022 19:36:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VA6QXjbjVXg3woU6A5yu7pj5ub/nw6AJU6IvOIgmuEk=; b=yTtaZo0rKK1Sc25VEo3H4HHjmY
	FgnG8I0t3QsuHY0o0OKdUg4ImUH2cq+fLDi5yU8RdiGhPI7QEzJSwMV1K2+KX4ID08Rej+yKtgRVN
	57BOmu5brK9iUYstPXfOirZu75bvhQ7EjVYI6Xhyd+65i3V6oeHgz9QH7LCaJaOkBVIxbsiaY5pIf
	VPIaD0yro69hfag6umKL/8BnItyoBZMPmB6WiVFyb1Q/PdAneVyFhbJ8BEiKGJt9nE0Lyq0r8te7f
	HCThilcHanc+/iz41abbgqr7VrUMwF4jWUlkeo2mYbdd5PSVRi037DTEEb22NMbjH7aEpH8lorMDL
	/V2lhtcw==;
Received: from ip6-localhost ([::1]:57680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noqFK-000m1F-63; Wed, 11 May 2022 17:35:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noqFE-000m11-G0; Wed, 11 May 2022 17:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=VA6QXjbjVXg3woU6A5yu7pj5ub/nw6AJU6IvOIgmuEk=; b=0BU6lI7Ldc358dim4SvXwEYGmN
 STJiQ9RYdm2Fj8voG8Y8j1HNHrtEk0a3tRlwS1R7AoE5EgB+6XEI3CVj0M+d6o328jgAWit3W+9Ww
 8xiuOQRLwkN260EuMCgAkEQcHyDuQOi+CwtruBleDxA8+Rm0vD5hr+RmfySCHdVlSWrvQOj66lsmy
 stVjTYLej709+F2l2lalSZu32sNjkwQ+VO6Ht0PfZOJUoM18AtCB+kjLHsYHbwwQ/YRcpv/3hLibG
 TbwYAK9X7jpCrhKS4ZpmKYFaqfRwAc1Bw83DdMYis8UF8r3TQ4GA1IAw+q6bF56RTeMdRSv0eHopD
 DD54Hii8tWDySNx47lfpKqI7Zw+4Kx9DE8KIrinio+RfiMXi7j7XBe9t+oZNFDhvWZsX/pZhZ8uLN
 hJQiA03hZ15u5z/TJ2U0oKJKEyh73Luf4sMrxMzpdOlyRc6SKVVpyjjEh4nFpanYBJPQKxsmKFD7Y
 q5HhZx1Rxy+4GANfzT3Zk9Kt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noqFD-000Ozo-Sf; Wed, 11 May 2022 17:35:28 +0000
Date: Wed, 11 May 2022 10:35:23 -0700
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Invitation to sambaXP 2022: digital & free - 31 May to 2 June
Message-ID: <Ynvz237Hx1gWkYPN@jeremy-acer>
References: <0597e6ea-0538-e867-542f-bf65ba641901@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0597e6ea-0538-e867-542f-bf65ba641901@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: sambalist <samba@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, May 11, 2022 at 06:59:38PM +0200, Ralph Boehme via samba-technical wrote:
>Hello all!
>
>From 31 May to 2 June 2022, SerNet will be hosting sambaXP for the 
>21st time – for the third time as a purely digital event. The Orga 
>Committee has published the agenda at https://sambaxp.org. Tickets, 
>which are free of charge, are also available there. To allow as many 
>people as possible worldwide to participate the program will start at 
>3 pm (CEST) to serve as many different time zones as possible.
>
>Special thanks go to this year's sponsors Google, Microsoft and SerNet.
>
>The kick-off on May 31 belongs again to the traditional samba workshop 
>by Stefan Kania. His tutorial (3 pm to 9:30 pm CEST) will cover the 
>topics "Setting up GPOs with Samba" and "Disaster recovery of an 
>Active Directory" at once.
>
>The actual conference will be opened by chairman Jeremy Allison 
>(Google / Samba Team) on June 1st at 3pm.
>
>Detailed abstracts and everything needed for participation can also be 
>found at https://sambaxp.org.
>
>Any questions? You can always contact the LOC – just mail us at 
>loc@sambaXP.org.

I would just like to enthusiastically encourage anyone with
any interest in Samba to register and attend SambaXP (timezone
permitting :-).

It really is a great and very friendly conference, where you can
listen to and interact with the people making Samba and
all associated code (the kernel SMB client and server).

As we can't all go to Germany to attend in person (unfortunately)
a virtual conference free to all is an excellent replacement !

I'd like to thank SerNet for hosting.

Please join us there !

Cheers,

	Jeremy Allison,
	Samba Team.

