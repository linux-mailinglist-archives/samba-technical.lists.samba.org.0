Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C22551F4CE2
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 07:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=v6imHwNDlEXeMgZugI29NEvAVytikE+2jonT4GYYv8s=; b=vbXyxc49rQS/E+msDk0cReixMt
	kd/BSAypVpqmP1cSUdjoyuWlRbD7oUut20CHL+bsDgP7hQRB9ySBc33TTPJz1z5AEEaZTy9lLL93Y
	fADBOMBZ+qrt+s4jDN/mzn0BTZo+Mb26FAHc1GyQ93fgG8IauX/Ge/IMCny/F1xDtqFXm4vhc/TLU
	xpibJXv9SHsc45zCirR1PpBgmwgtbUVf3uANJuMJh/QS0Pa9VVP1uiKkdC83UL2xsAFrn49ugtO1Q
	MDfXIsVspx2tITQSiwiDFiEcw5a66zepDvkRmw53pBdFPylPYaYJFNDcyymHjtaCyVf81kig0mq+k
	nsN6lWkQ==;
Received: from localhost ([::1]:18064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jitGk-009hQd-F9; Wed, 10 Jun 2020 05:27:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54422) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jitGf-009hQW-KI
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 05:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=v6imHwNDlEXeMgZugI29NEvAVytikE+2jonT4GYYv8s=; b=Ei+pWAh7o5nlKv7y4VpyZOSj3D
 ou6bJKuox5TlhU6+/MnhoZsYq+Xoak9aLvmF2m/VtkIb/deYdqih57OGLC/2lrZqXti3qlKstzUMM
 1r4OVoDtBi7TitYqrWz7lInHzcdR0YsHMI6Szla12TAcobmf0aKUFYMbqb/fQnWmf7HbM7cNcOy9+
 7BjugB7DmGm/K7VCTczGUtM5kJ2WnzzRp7h2YQ8OaO0J5kfb72o4ZdJaidGQ0icxVTHjdE7+2vHcC
 5YvMTJJLZ93kfmgxbeB9WrTToQISTQRlTLJ+jYLtzzcOvNDV3UwP9UVbPQtfALcnkega6af5zXaGZ
 KsRU6c4dIjvc+A3uYA2EJQkr/CZZf+PO1nQoiR2cfPCuSx2sfpsH1y0pW2kho+CDpYLLkTFjaebgB
 7tennztcEL15X18LHcYJp0lLjC5DJQVKSjJi1v4PwXCh2Z6KnoZ/slwTgll2YJNVo1QRMuw7lQQGa
 xX1PxAsA+pOhP6Gbs2lEmhGb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jitGf-0003Bc-0C; Wed, 10 Jun 2020 05:27:17 +0000
To: samba-technical@lists.samba.org
Subject: Re: git signoff+ and review+
Date: Wed, 10 Jun 2020 07:27:16 +0200
Message-ID: <2202468.ZbZBhtArCh@magrathea>
In-Reply-To: <d964391f79cd21db4b1c4118ab62909b6ff9717d.camel@samba.org>
References: <2070261.IvKQ8U6GgO@magrathea> <3376401.t2CYSfcsgO@magrathea>
 <d964391f79cd21db4b1c4118ab62909b6ff9717d.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 5 June 2020 11:15:22 CEST Andrew Bartlett via samba-technical 
wrote:
> On Fri, 2020-06-05 at 09:56 +0200, Andreas Schneider wrote:
> > On Friday, 5 June 2020 02:06:56 CEST Andrew Bartlett wrote:
> > > G'Day Andreas,
> > 
> > Hi Andrew,
> > 
> > > I wondered if we could have an agreed set of aliases included in
> > > Samba?
> > 
> > You cannot include those in the Samba repository. Those are all
> > individual.
> > All you can do, is provide a script which could set them up running
> > 'git
> > config'.
> 
> Do you mean we can't do it technically, or we shouldn't do it because
> we are all individual developers with our own way of doing things?

I'm not sure how you exactly want to achieve that. Please educate me and then 
I can help you :-)

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



