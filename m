Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2591F2152AD
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jul 2020 08:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dcPyzQpX8JdI/+2aktq+rYwh1NzCkqb2Xf6wEYG8Xog=; b=3kvZDTT21lJBiNslzVLnouI0XG
	jcNKPBSEmKj2xLSc7o/RTEhzfWcFjZk2aA7CvlBIM9PbugeqdnRmDbycBsz0jGZx4Vm9fcEL/icQ0
	0uptqg9dOWM3rsdELlj+jqoM7CnGazIeCjpjlXN7BBPt3ofON/sdSvPgnYOcujK5Dfcj2mVuPeu2o
	uSGLAQu0F+iKIblz+ffnAqfinx/YajVT7K0xatUWS//hyoQ15tvYaxpm6ymGNd9+Tk6qhyCCmILwA
	ehbzmLjhisNEQ00NgHXvXh13Oxo+bKw5O4RzWXMuaBHx3JQ30IPZbOlIcyh8mHabnwHnuFp3OjVL0
	eAfEcEsw==;
Received: from localhost ([::1]:54212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsKYv-005ew4-Hn; Mon, 06 Jul 2020 06:25:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38579) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsKYl-005eut-Jn
 for samba-technical@lists.samba.org; Mon, 06 Jul 2020 06:25:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id w16so41219242ejj.5
 for <samba-technical@lists.samba.org>; Sun, 05 Jul 2020 23:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q0codh+ZMSul9SfIBKV18szKQPW79x6WrciXT9Z1Seg=;
 b=gCxL+pDVMaJbyYE5FdXM3V5tmTzX3TlDE+NCrMzWR/Q5GXK/ktlvKRW6azQQh5Pq90
 vAgMzt3hshsimZM2pnzrK667kxCF8GnREZlR/b5HvFXah1uioQTBzhoXdRRbDU/6YzJx
 wsAbP3+JnKCFsnBUZTm72lR3tdLvm62WJ3uo58vofE5sjeWMZnA9Ie0UucRJm64N69Z4
 eNu6Au1E3hIndRZFjSSmB+92P3fXhjBlepS58JUCXN7bFvCdSQm+qQYQa2OtMQ5eHZIx
 H7in/nYwzJO0i23wVKo+isRwx1HAZmhXUGr+jf+JwvCbFCrHMTFQSSfXYLhpKjOJCf0y
 Ex9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0codh+ZMSul9SfIBKV18szKQPW79x6WrciXT9Z1Seg=;
 b=IPwmIP9GTbCRX1cv+lFTv8DbSJACkbqrD9VujXEGICOqDIKUCIjHYktGT3Wjs1CxX1
 LBTiVB2ay8e7O76ZvWNA4gSveFwoEgXvfPuRw7x3W6MsKrwqLO5MFtRGE0Jvzx12/CcV
 1JREq+txzJldpJdNehvkRQpW9ZfSZE3vA7cN0TCErBHX4uRaaQ9p5Lhyz6YhFYCuPhZN
 klQN9fwDdfHb0KuzqpMmnSRuZMdgYx7mn8JJ5CD7N+ZyfuBA+MLEO35P3K1au6oJDw6M
 DddriCt6z7ety3Xz4IrJu7coSDnJ0wsu5sTpzvYp+rOemPVL5UZwDBM0Nj/9XBgEE4un
 sShA==
X-Gm-Message-State: AOAM5304zr2K3/LKmz32jWLBN7ykKWDw9tTZ74IfUmtYhAAl40n0a2AN
 GUAP9lSdX3HSfp6ALsQlPQnZSSraZmrQyVJ9ZaYm0LeX
X-Google-Smtp-Source: ABdhPJx86oO+jS9uOQGgx7NfA2l0Gv6GeprNr1ZZaQ/Ps4SbYKCPClW8WiGvHT8h2CRI+TkmwnmQRU7kgxyW46zCm6k=
X-Received: by 2002:a17:906:5fc4:: with SMTP id
 k4mr41749270ejv.94.1594016698620; 
 Sun, 05 Jul 2020 23:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCUABcQkZ3yyWzATYi0ZeUTsLGGi90Kbk7ySAY6Z-BZSJg@mail.gmail.com>
 <20200704170227.GA866108@pinega.vda.li> <20200706061945.GC25598@pinega.vda.li>
In-Reply-To: <20200706061945.GC25598@pinega.vda.li>
Date: Mon, 6 Jul 2020 09:19:30 +0300
Message-ID: <CAH72RCU=5yTWZ3hSf-_r-cHW2F_knbHW0eZRQ4ngXBkaucWM0Q@mail.gmail.com>
Subject: Re: GSoC Update and Phase One Feedback
To: Alexander Bokovoy <ab@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>, "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you.

On Mon, Jul 6, 2020 at 9:19 AM Alexander Bokovoy <ab@samba.org> wrote:

> On la, 04 hein=C3=A4 2020, Alexander Bokovoy via samba-technical wrote:
> > > I have decided to work with the Open Build Service, from the
> recommendation
> > > made by Alexander, to build the packages for various distributions. I
> was
> > > making the assumption that the most popular distributions used with
> Samba
> > > AD DC are RPM and Debian based. I'm seeking the community's feedback
> so as
> > > not to make the wrong assumptions on this.
> > > I created an account with the build.opensuse.org and have been
> exploring
> > > the UI and going through the documentation for OBS. I also created a
> > > Webhook in Gitlab to push the code to build.opensuse.org when there
> is a
> > > commit in the master branch. Is this the right way to do it or is the=
re
> > > another option?
> >
> > This sounds great -- we can start with RPMs as the spec file is already
> > there from the Cockpit starter kit and it works, so it should be
> > possible to instruct OBS to build RPM packages already. For Debian
> > packages, I'll look tomorrow for an example (Cockpit is available for
> > Debian, so we shouldn't have a problem to find an example for external
> > plugin package build).
>
> For Debian packaging, I found this very simple tutorial:
> https://tribaal.io/very-simple-debian-package.html
>
> And then there is a special helper that allows to add Debian packaging
> to a nodejs app: https://github.com/heartsucker/node-deb
>
> The latter is not exactly what is needed because it is tilted towards
> actual applications, not plugins like we have, but it should help
> started with a boiler plate.
>
> Cockpit itself builds a tarball for javascript-related stuff
> and then simply installs its content into the expected locations.
>
> Andrew, can you please help with the Debian packaging?
>
> --
> / Alexander Bokovoy
>
