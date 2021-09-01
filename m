Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9143FD095
	for <lists+samba-technical@lfdr.de>; Wed,  1 Sep 2021 03:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YJjRdAE9TfUufx7EUwwOpSHAQXVZ7C/duCK777UHOt4=; b=KgNTWkBnTvHZA1RV0UonAkoge+
	3ok6NICI3rHmQxaNB+osefoFd7yrX4IA2zMuWNsE3pYurJMYQq417HC7emhSTJyp7JtCNOoIB+PLf
	+IHg78cPIrEnWUBF1LllRF9ue8rIWONPvDeJ1VaEYbRIMaoe0bdeqNisYrtmVKfhgf9m9foFi/Pal
	KBkdlOWi+bkDjjWqnZ0ZfAbSnqeQPUq2yNGARhH1oM4kwhXH3QOLnmmsuXn3wpVf9vCqKyZbINctN
	lW0vJ5s1Dva5pVaK66SMP0+oCzz6GmEV2L0VEttBN50PK6dCEpevoxNJ+fbyNxU8ZnH00CIpRaI7Q
	PWPazRww==;
Received: from ip6-localhost ([::1]:18628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLEiF-00CBrc-Hy; Wed, 01 Sep 2021 01:06:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50694) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLEi4-00CBrO-Ac
 for samba-technical@lists.samba.org; Wed, 01 Sep 2021 01:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=YJjRdAE9TfUufx7EUwwOpSHAQXVZ7C/duCK777UHOt4=; b=J8/ioz6L7ZGyzy8aS4cRcGnBAN
 nAZjhaTYXCek+NjU8+AcPnmSgIHpEMYj7zhXOS1PR/AXQEPd65LrX7q58kJ6OjUwck1maFfqC9sbS
 hqHUReOn8zSfM2s7BArpUJ0Imx0ZjDWv3mR+KNz8iCDIXfcvzmc0qKLHdhaMK6/Mes7lysCr8Pvf+
 ZlGeXeYL2Oux5vb3ZypSvVu31nnonsj3+6LgVLMLhciewQxamhw2cqaoEeUDsOSU927p5jRKRjCxp
 gsxJGUG8hJL8YejOlNkJxzZsZEzhnuM8fewaLXQ1VyikIPdTQa9phJWkjztMKEvqFhbbhZ8vI41TP
 g47zlPTG6TAaWt1CA1tUf9WsJwNLvlPifLTayuuCrJSgpMCuspwlrOlXpf7U+J26+jhRvz/uCH74m
 B7fu1yTJ11q2KrKH3iN5z9hx02xzN6gW8Sxn3fkolcde1CeAXcZJJdl07q56k8PsXrcCugDV7+jjf
 niuVoOKRaazdU4DfhzGKKbFU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mLEi2-003x96-Rc; Wed, 01 Sep 2021 01:06:35 +0000
Date: Tue, 31 Aug 2021 18:06:32 -0700
To: Namjae Jeon <linkinjeon@kernel.org>
Subject: Re: [GIT PULL] new smb3 kernel server (ksmbd)
Message-ID: <YS7SGLe/56F+DglN@jeremy-acer>
References: <CAH2r5msoKV7qAgoKipa+QNDJ+xR83YGuz+he+GH9sPTSzBMLHA@mail.gmail.com>
 <163042809342.7406.683232852261811056.pr-tracker-bot@kernel.org>
 <20210831234757.7467527b@samba.org>
 <CAKYAXd-N2BQE1JQ_UgLc=ss8cuvaE0GMKQDrEhMTOMPLeG5-Jg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKYAXd-N2BQE1JQ_UgLc=ss8cuvaE0GMKQDrEhMTOMPLeG5-Jg@mail.gmail.com>
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 01, 2021 at 07:58:29AM +0900, Namjae Jeon via samba-technical wrote:
>Special thanks to Steve and Ronnie.
>
>As soon as I woke up I just noticed that ksmbd was merged into mainline. hurray!
>
>The dream has finally come true since sharing the prototype version
>with Steve in 2015. First, Thanks Steve, I think that your advice on
>the redesign of ksmbd and what we need for the smb server make current
>shape of ksmbd today. Also, I am very grateful to
>Ronnie's e-mail telling me not to give up and continue the this
>project and lots of technical advice as well!
>
>Really thank you so much for supporting ksmbd upstream again.

Congratulations Namjae, this is a great achievement. You must
be very proud ! Well done.

