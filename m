Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B66171CBFA1
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 11:08:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=eORUpPsy1RDBRJv3xqw2MkbWkRJj1WMWIRaa4pR6SMQ=; b=hgpXESkSda2Cn5T8huGfOdIHv7
	SVbpo5GRHXVrSH/AQm+M10vntSF0niUroO9ZZA4LAilORagX2UI/KgDVQd1D6KzPyDjvpppvyGNcK
	JgC6xClPCHPw+eCCoM8opY0vXJ7Qr2RTr4qQ3JFa6T3zumUwZLIddRGPX8klUzYUuUIlZ8t0c846F
	zWzebrVijz9+ZLeUYzTV5HcSxMHfjlXGXmAyjlVKiJ/xoMV9OGuqn8dz7UAnYawW3sYRymsMRvjRe
	/T7kUkCBRFb2dJVn4I1KRJ3gh/IkVh9HKQE3ih8Nk/aV2sDJEIzCJWREOrMI1BrNUW5d2p1xc1OPo
	P/8eFZvg==;
Received: from localhost ([::1]:26698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXLSI-003Pp0-5D; Sat, 09 May 2020 09:07:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59946) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXLS3-003Po2-6L; Sat, 09 May 2020 09:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=eORUpPsy1RDBRJv3xqw2MkbWkRJj1WMWIRaa4pR6SMQ=; b=dAlvPk6LjBgiLXSNtLwnHN9fMB
 Cm6RU0+v4/80wtJxUtIXEbi/U3rqPr5yimPJGeajFgW5OceO1iEv7xyAE2Eij9CRjaFYEPlsR9Krd
 xPo0dhzW4jB3AXz1DbTrkaZuM1yXJlhfWdSpFhN4PkKh+/5BVJlTYbsjplDPYpWrNkcIgJBg6mTyL
 UYxwH1/lvAgCyYJSXxjkp8MXCwCY7U8BsE+ngod+eWpsbfn4OHnEDo4b72AI134Oyl6yTSV2kRSw9
 SWRZI7f97zgubeGp9dnkZ8k87hm8Px/uj2Lqs6t/Ks3T7HcBnqz5e7EE5XO1jhxEhvtFWmnXsTZdz
 EIySOJ3cZC9n4hdPEhaZLbU3PJEPJlazbI6H7b+4SnScSJ57pZ2+Nc9J8kqqtHHdrkhccre9X+OXC
 ivRadDuIhLJO++ArMf1RnSFBZ561lXi5fMrSr2iNOcZFou6H2n1Ruxi8thX119KjNmmH+Dh2Op+dC
 i4n/WMpDp73UBVcQY29wpq6n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXLRy-0007HS-Vv; Sat, 09 May 2020 09:07:15 +0000
Message-ID: <afbe2e45138abb7ab07f95bd53ebb74daab98392.camel@samba.org>
Subject: Re: [Samba] Win7 clients problem after upgrading samba file server
 to 4.12 on Arch
To: pavlos <pavlos.audiofreak@gmail.com>
Date: Sat, 09 May 2020 21:06:47 +1200
In-Reply-To: <CABTC9XxtOR7m5mBuJciYsGFXFe_xEoJXRbVAxSJA_EG2Ptg=6w@mail.gmail.com>
References: <CABTC9XwbzmfEUKu+RA2b+bRjLKzdXzWkZo7E2FhUX+fKMiXw=A@mail.gmail.com>
 <a4ea6ee9-1717-9c27-bfae-258cf1afbe06@samba.org>
 <CABTC9XyU_bFhj6-rCC=wGFHrtq+24sq6kqA1kW=B4ZOVHC2uyw@mail.gmail.com>
 <741f671f-d7ec-4fb0-1f08-dfde0bc0d2ad@samba.org>
 <CABTC9XxvL_2s_TpBtdvz2rsNrNsypC=BJb1cYdDq8vFLpOjtpQ@mail.gmail.com>
 <e502c62de797631ee8395d4bc9204b913a45f10d.camel@samba.org>
 <CABTC9Xy8NjY6k2FQOB9cWOjFN+ys1zm0jqxZDPnoPK52WfekOg@mail.gmail.com>
 <d9ec8706f92bdd6eb3aa9a727da957517f7429a5.camel@samba.org>
 <CABTC9XzV5pXCkximUB5P_+SQLetH_sr45oZjSm1HcWDy2QPrMA@mail.gmail.com>
 <01153dd1be46db8376a49f0d09237ae6763cad77.camel@samba.org>
 <CABTC9XzA0njuzR98jTD4T7U3Ntn7hLqvtMhvkcEYn41p+O0gMQ@mail.gmail.com>
 <CABTC9XyPbRLHJvkAhzPSqNdhD3Wk8xSbnSALQscqa_H0aguiwQ@mail.gmail.com>
 <CABTC9Xwz2Qd2c6mrp__j+MWpQOg6dH8peHSxYpAGx3NxE1cJ-A@mail.gmail.com>
 <ea5d5a254c3bb3692073fc396fb05cd55bea3f77.camel@samba.org>
 <CABTC9Xwk7AiAMn+y63AOcBVDWu6pi-q=XFMC+E=sf6h3uUs79A@mail.gmail.com>
 <4ea864117a088f3a799ab9b99094f543d86f2aac.camel@samba.org>
 <CABTC9Xxv-vyyFqfoeMS98YN7BGsf_4dBfXtVAHDxZLvRz99d_A@mail.gmail.com>
 <fd505ee92e4a87ca2da3981e969692a7612f382a.camel@samba.org>
 <CABTC9Xzb=BC__k8cHAs5SyxU4FmJ20KGACsB_0UNtRDrjuVkGA@mail.gmail.com>
 <cb748d0ac7e9af2a77476a75cb5cf859aae0dd65.camel@samba.org>
 <CABTC9XwTaExDKD8NBmJ4AxjN3=6nEmvWQwAiYAK_nhwPhC+vog@mail.gmail.com>
 <CABTC9Xw=+zgRZz10ipqmMLG233RPJ_-7G-Dvxx5cFR+XVc5DAQ@mail.gmail.com>
 <CABTC9Xy=7O93QPBa4cy+ht2rv_q5k4uLfe3NJZxZt7MgEqw94Q@mail.gmail.com>
 <dc5aeb2762d8dd1153e1a4039a1125fc5340b276.camel@samba.org>
 <CABTC9XxtOR7m5mBuJciYsGFXFe_xEoJXRbVAxSJA_EG2Ptg=6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: sambalist <samba@lists.samba.org>, vl@samba.org,
 samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-05-09 at 09:38 +0200, pavlos wrote:
> Hi Volker, Jermey, and the Community,
> 
> To be clear: I didn't analyze your code, I don't know structures of Samba, definitely I am not a person to judge and blame anybody :)
> I am sure that there were reasons, you wanted to clarify some issues around controlling share mode flags. And it's rather everything OK with your code.

G'Day Pavlos,

You appear to have identified a regression.  We take these very
seriously, even if only exposed by older clients.  

You have done us an incredible service in identifying the faulty patch.
It is much easier to fix what things once we know how they were broken.

I notice Ralph has picked this up, which is awesome, and while I can't
speak for his eventual patch, for something like this a smb.conf option
or client OS detection isn't normally required, we are pretty good at
just fixing it to always 'just work'.

But none of this would even be a conversation without your diligent
efforts, and I hope you can get a good sleep after such an exhausting
chase.

You have met the same standard a Samba developer would take, to bisect,
then revert and prove the issue goes away.  Don't doubt yourself!

Thank you.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



