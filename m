Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6651E4F1384
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 12:57:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ovz03N8Wp29yuvSCvcdXUqDKNtr38xucksr3wvaM+gI=; b=Gwb/HUbmwEpzPBclVjCooQI0da
	8z3klecjLc7hGT994x/LjCub738kJPlhOqEubF7obNVyugM266MjUeDoAtZzyeM+xCPSJcoCsCZ+z
	8MWpB+L64bQgThqQquU9uTPkhrpU4Z04KRNCs5ho/6ybTt00soFwPYALsx0O25XVZ0fUaTy5ijJlj
	iO2hdCB8M2m++gU6qZMFkzx47NpEX3y+shgEPVCYt5lFDjrRY+blSGSfE+6wKcoT+tCnqHI6l0Xbj
	Lo4q+44+4cxWCFIuV7XARTu4e03VuX5zMG3v+xjUgTyS9ykFY6PEqN+fSpmPDAs6IxvFuq0E2uLuB
	EVmtPzsw==;
Received: from ip6-localhost ([::1]:33056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbKOt-009ma0-5O; Mon, 04 Apr 2022 10:57:35 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:35104) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbKOl-009mZn-GV; Mon, 04 Apr 2022 10:57:30 +0000
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2eb43ad7909so43022467b3.2; 
 Mon, 04 Apr 2022 03:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ovz03N8Wp29yuvSCvcdXUqDKNtr38xucksr3wvaM+gI=;
 b=FzuH8mGlJvpG8TzDRb85g+r2Voa/58wkvTl7Nji/nrzG0G/brG3xwj1MG6xxapvVee
 JYrKfzKni55Eewr71WzIDTxaB8pLspqEM1/Ml7ng/CLj6mvAJxxc+DzSu3nPtKAr35tb
 Mipa/zoaNXT2U3NE0MF006uqpzBxdJmKjY0HJkl6TS4oFHYakRIBpYmqftWTKdxAsuqL
 PgJXwLbBvI+3X+iGJfnKttpUfs3jkKAJ5Zb8k4zyYddSQ8Ss5s4QeXSyAhKjQYC3XIuf
 O37cGQPGmvm12rBUdrEYe2VvwlxxDO8ro151YCkMJBJzz4ZwJUEd/6Vh1T3+s6g3hc6s
 PYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ovz03N8Wp29yuvSCvcdXUqDKNtr38xucksr3wvaM+gI=;
 b=uYraBnyO58dd/nEQtQjVBmErpjCwk0nGLy+NByApGC1fk9C3ymERit6bDR2nlSXzYR
 XS3BKKc28zPh827UAn1To0iWJxi2Vn7cJv8dyXZSD8oYOVZH1CWZDIiaI9VAsRp5KSLM
 RLUmOkcrJUt48zCYSmj2eTlg+SfBW/2spmSvVY1D7xRC8bWuxvshGX0ixrroDopFd5yI
 aGPRNvk/XdM9VMalkPmrfbNY5KJ4DPIj3O5nJjD07lIjTMOtyP/gN/r8749ncigHJM6a
 0c6/emlZWjcN7pyJZYfAycfitSTL2z3VFKdrvZAqIbfGV3/Nk5HVWddXtm8amQTBu/6d
 CviQ==
X-Gm-Message-State: AOAM5330pghsJz4XHiKFlWyN9mKAUtHAqJ2MmmdMvLx2gVDxXmPAuDpK
 TrXfR4zEWUmz/et58I2HHIGCSf1lQT6dIT4IMg8=
X-Google-Smtp-Source: ABdhPJy8s4fOo1xHiM4xndVp8hCXr1jUKp0+/JATvcFiMNLJ3oB3HJJ9izCZM501Oe61HB0toXlXqU1v6dWID7IM+9Y=
X-Received: by 2002:a0d:ffc1:0:b0:2eb:5353:3199 with SMTP id
 p184-20020a0dffc1000000b002eb53533199mr7025873ywf.440.1649069845193; Mon, 04
 Apr 2022 03:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <0a610624-79ce-6fa4-bbe7-3612969e5b74@samba.org>
 <CAH9M6r+SBJwNphbHQPuRLG=c-wZbEnETPVYogaYwYeKMWBYpdw@mail.gmail.com>
In-Reply-To: <CAH9M6r+SBJwNphbHQPuRLG=c-wZbEnETPVYogaYwYeKMWBYpdw@mail.gmail.com>
Date: Mon, 4 Apr 2022 20:57:14 +1000
Message-ID: <CAN05THRsZDpLDuh+zmAgCCukkvZg7yM9KEQggND8nNDHO0u4zA@mail.gmail.com>
Subject: Re: go IPv6, fade out IPv4
To: Aleksandar Kostadinov <akostadinov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: samba@lists.samba.org, "Samba.org Admins" <go-ipv6@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Aleksandar,
I don't think they are interested in any replies but this is just a
spam email for "buy our ipv6 service"
That is how I read it. It describes no problem, aside from globally
routable ip4 addresses becoming scarce and expensive, which I doubt
applies in any meaningful way to a SMB server,
and it describes no solution or action plan, aside from "we don't read
mailinglist replies, contact us directly".

In my opinion this is just a fraction above getting a phone call from
"This is from internet office for microsoft, you have virus and must
buy pre-paid google-store payment cards and we can restore internet"

Am impressed they did personalize the spam/scam email and even wrote
many paragraphs.  10/10 for effort.

On Mon, Apr 4, 2022 at 8:37 PM Aleksandar Kostadinov via
samba-technical <samba-technical@lists.samba.org> wrote:
>
> What does it mean "building IP nodes", excuse my ignorance. This is from
> RFC 6540.
>
> It seems like Bulgaria is another country where it is rather hard to get
> IPv6 support. Depending on the actual location. So I'm trying to understand
> the RFC requirements and be able to properly advocate for that.
>
> Thank you.
>
> On Fri, Apr 1, 2022 at 3:09 PM Samba.org Admins via samba-technical <
> samba-technical@lists.samba.org> wrote:
>
> > Dear Samba.org list members,
> >
> > as you might have heard, the pool of IPv4 addresses is exhausted since a
> > couple of years already. As a result of that, companies can buy IPv4
> > addresses in online auctions and the prices for that are going crazy.
> > You can have a look at https://auctions.ipv4.global/prior-sales to see
> > the current prices that need to be paid. These days you can get more
> > money out of IPv4 address blocks than out of Bitcoin actually. Don't get
> > us wrong, we don't recommend either actually.
> >
> > Also our hosting provider was forced to raise the prices for our IPv4
> > addresses considerably and announced that the prices will be raised even
> > more in the near future. We're expecting that we'll soon have to pay
> > more for the IPv4 addresses than we pay for the server hardware itself.
> > For that reason we're planning to get rid of the rising costs of the
> > deprecated IPv4 addresses.
> >
> > We're offering all of our services via IPv6 since many years and we want
> > to switch them to IPv6-only in 365 days from now on (2023-04-01) to cut
> > the unpredictable costs of IPv4.
> >
> > Most people already have IPv6. If your provider doesn't offer IPv6 to
> > you, you should contact the provider and ask him to enable IPv6 asap.
> > You might even ask your money back if you had no IPv6 in the last couple
> > of years, because the 10 year old RFC 6540 mandates that IPv6 is a
> > must-have for nodes claiming to support IP. In other words, if you don't
> > have IPv6, then you don't have internet access.
> >
> > We created a web site for you to check if you have working IPv6 support:
> >
> > https://ipv6-test.samba.org
> >
> > If you see only a sad face, then you have only IPv4 support, if you see
> > a sad face covered by a happy face, then you have IPv6, which is good!
> >
> > Apart from your own internet connection, you should also check that your
> > mail provider supports IPv6:
> >
> > You can *receive* mail if at least one of the MX records of your mail
> > address's domain has an IPv6 address assigned.
> > https://mxtoolbox.com/MXLookup.aspx can help you to look that up.
> >
> > For testing if you can *send* mail to IPv6-only mail servers, we've set
> > up a test mail domain. If you send a mail to test@ipv6-test.samba.org
> > then you should be receiving an immediate mail refuse error while the
> > error should contain the text:
> >
> > 550 You can send mail to an IPv6-only mail server SUCCESSFULLY !
> >
> > If you got that error, then you can mail to IPv6 domains successfully.
> > If you get no error message or if you get any other error message, then
> > your mail provider does NOT allow sending to IPv6 domains.
> >
> > Luckily most mail providers DO support IPv6 these days, but there are
> > still some well-known ones which don't. If your mail services depend on
> > Yahoo (like yahoo.com), Apple (like me.com, icloud.com, mac.com), gmx,
> > web.de, t-online.de, posteo.de, Protonmail, Gandi, Mimecast, Zoho or
> > Rackspace hosting, then you will be out-of luck probably.
> >
> > We believe that providers who still don't support IPv6 in the year 2022,
> > have been sleeping at least for 10 years. If your provider is one of the
> > sleeping ones, you can try to wake him up (good luck!) to be able to
> > keep on using our services after we disabled deprecated IPv4.
> >
> > If your provider doesn't wake up (quite likely if he slept till now!),
> > then we recommend to switch to a provider that does support full
> > internet access, which includes IPv6 of course.
> >
> > In case you lack IPv6 in your corporate network, then ask yourself if
> > you acknowledged the work of the networking team enough in the past. Buy
> > them a coffee or a bottle of wine when asking them kindly to enable IPv6.
> >
> > We are aware that in *very* rare cases someone might live in a country
> > like Greenland, where it's not possible to find a provider with IPv6
> > support. In cases like that the friendly guys from HE still give you a
> > possibility to use IPv6, see http://tunnelbroker.net/
> >
> > Side note: Also github still doesn't support IPv6 and doesn't show any
> > sign to improve this
> > (https://github.community/t/github-com-not-reachable-via-ipv6/216624) -
> > samba.org switched to gitlab, which DOES support IPv6. We think that
> > nobody should deal with service providers that don't support IPv6 these
> > days.
> >
> > Please don't discuss this further here on the list (we'll ignore any
> > list replies); but you can send any feedback (both positive and
> > negative) to go-ipv6@samba.org. We'll consider your feedback for our
> > future plans.
> >
> > Your Samba Admins
> >
> >

