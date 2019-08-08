Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C9E86163
	for <lists+samba-technical@lfdr.de>; Thu,  8 Aug 2019 14:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lW1CUzCmR+Z6LFgH+aSPcQ6K/SaxtBRTdLeDCCW9EEk=; b=JV50uVjg/MuWs7NuOED/MNnSVk
	0Sk7wjBZYkIksDlUVBnkevOWuONmabDekygrPBbd/aZvTnPGGn7D+xh9QMCMuJ9rVIBEf+8eIW+is
	Zb0SBTy77bETnoiXp8vfIMufIz1rtZuU37Ae+ryUCjvhmAs606baKVFUY2Z43y+MAjluRiKZim6BD
	mptxp/AxnwSLBh4WI4vHrpkb0vvxe42s0TcnTnuOAufB2WKnHCcchHLmDrb/oxCZrc2PdcFpdwqcz
	1u+HdBzCcMIwVr/i+w6jhaVq9VLbexhakYmDS9GeXi0bKz8eNybK6ZawyZyg15wYVFAXO2jNdsftK
	PycRxVPQ==;
Received: from localhost ([::1]:20032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvhDo-0058lf-Cs; Thu, 08 Aug 2019 12:08:44 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:36622) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvhDk-0058lY-1d
 for samba-technical@lists.samba.org; Thu, 08 Aug 2019 12:08:42 +0000
Received: by mail-ua1-x931.google.com with SMTP id v20so36317853uao.3
 for <samba-technical@lists.samba.org>; Thu, 08 Aug 2019 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lW1CUzCmR+Z6LFgH+aSPcQ6K/SaxtBRTdLeDCCW9EEk=;
 b=WKfu+s/zK9XrlosB4xLf+MVb/ueOZepZrxnaV63wSw7XU1pvvB1IMJ+z4TYSz3xryQ
 VeOgwsNRYDueoie/w38jxXAPUGsVXsxr+S1yZrSI+MkZwx6LSDd7uYoXmxTGpOYWmZix
 SQ+e/hnuEF4G+IeScRFvtvXsSZSTky9cWDu4OGOsmYmY3emkrBcJa/smHfM5YQA/nyT5
 4vr1vR/hC8IDtt5cgOqo+ZeJMetCuvUoyX9vrtau+weLkBlOH6MqgdKL6q7LqrQucSnx
 vouw2GdVY3yufAVvOWQtwlZaAmOmqWUVZMOgOThCdOqSYZxUxDrqNzoA5ap4u6SEuxbV
 6rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lW1CUzCmR+Z6LFgH+aSPcQ6K/SaxtBRTdLeDCCW9EEk=;
 b=OKL79P9zmb4WEecb2l9Ywr0mj0zLljmXrBBnn4r/otlBeGYdnNQqDPNr+TVNGE/Yw9
 0NPf2Tz1QokVBbCjp8m5GCACp/gWSqVmmngDCgRFJoWSk9e/hLPNvveE3ivAnuSgn238
 wPDSBK0hceStnUT3ELi7vnTB8Eu66tzk51HodHJs1IYaEDRHZpNYkZbNyu6mjnXrmxko
 tsK7ViY4YkdpcvWlctnKA9y6tSTK6JFuXG0m8/GG9ajW42jxy4eeVB2qKWNY5w44Ry9+
 eWKWLtQZZ205mWF/Vph1Rpn/uvJV6InCrAnquY0T8v4pGbWm6VRdHxt6PdDtBMRvBDgA
 U0wg==
X-Gm-Message-State: APjAAAUqWfyJsPsBs48FAyTn4hEf8zCyByl65MEARgYr07p8VXkso8by
 Aa7iYP7enHj8QzSU+jtNOEtUjulas7KDAgmd3JOxsA==
X-Google-Smtp-Source: APXvYqzTi+PjkJ85g0kbycAXeYQVA4wtDCcBLIMmSIaGNqx0REyYTIIZRkMnEP3Ew3g7dmDUL81L8iTqHrDp+va3A1I=
X-Received: by 2002:ab0:a1:: with SMTP id 30mr8948199uaj.29.1565266118166;
 Thu, 08 Aug 2019 05:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <1564547155.4261.48.camel@samba.org>
 <CAOCN9ryBOTTTB8UR2fNX7ZMDM0hJHKT7-Ys8v-VDv4BCgp+uug@mail.gmail.com>
 <CAOCN9rz0wCkZZvzsjsXKcm4+Jv0nQWicmuk6PeYwUNGinMyq3Q@mail.gmail.com>
 <3136808.qJGijLCe70@magrathea.fritz.box> <1565240829.4444.5.camel@samba.org>
 <CAOCN9ryeuJw0PuArfBd6BPfQ1kwwm8o8fuLmZa=dMnhsJoAtuA@mail.gmail.com>
In-Reply-To: <CAOCN9ryeuJw0PuArfBd6BPfQ1kwwm8o8fuLmZa=dMnhsJoAtuA@mail.gmail.com>
Date: Thu, 8 Aug 2019 08:08:26 -0400
Message-ID: <CAOCN9rzscaerfFOWyV7WqHtF1ehYPZXOcDiDnexJtiopKkdSMA@mail.gmail.com>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
To: Andrew Bartlett <abartlet@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 8, 2019 at 8:06 AM Nico Kadel-Garcia <nkadel@gmail.com> wrote:
>
> On Thu, Aug 8, 2019 at 1:07 AM Andrew Bartlett <abartlet@samba.org> wrote:
> >
> > On Thu, 2019-08-01 at 08:58 +0200, Andreas Schneider wrote:
> > > On Wednesday, July 31, 2019 7:37:10 AM CEST Nico Kadel-Garcia via samba-
> > > technical wrote:
> > > > I only repackage that, I didn't write it, Credit where it's due, and
> > > >
> > > > quoting from the README.md there:
> > > > > > This is based on sergiomb2's work at
> > > > > >
> > > > > >  https://github.com/sergiomb2/SambaAD
> > > >
> > > > So Sergio gets credit. But I'm already using it for RHEL 7/CenbtOS 7.
> > > > I've done some very limited testing with RHEL 8, but am waiting for
> > > > CentOS 8 to finally be released to really test  that.
> > > >
> > > > > > [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> > > > > > requires AES-CMAC-128, but the impact would be far more constrained.
> > > >
> > > > Fair enough. I'd say accept the requirement of a compatibility library
> > > > for older operating systems, and I'm glad Sergio did most of the work.
> > >
> > > Is there a copr repo with the compat-gnutls34 available somewhere?
> > >
> >
> > Do you mean this:
> >
> > https://copr.fedorainfracloud.org/coprs/sergiomb/SambaAD/package/compat
> > -gnutls34/
> >
> > Andreas,
> >
> > Can you take charge of getting this into to the CentOS7 image used for
> > CI so we can proceed with this?
> >
> > Thanks,
> >
> > Andrew Bartlett
>
> That's the one I use. I refactored those for my samba4repo.
>
> https://github.com/nkadel/compat-gnutls34-3.x-srpm
>
> You'll also need the compat-nettle32 package, which is a dependency
> for compat-gnutls34.
>
> https://github.com/nkadel/compat-nettle32-3.x-srpm
>
> I'm not sure what you're using for CI. I really have gotten
> comfortable with the "samba4repo" setup I use, where all the libraries
> are in their own git repos and I use git submodules, and I use "mock"
> to provide a full end-to-end build of all the packages in a local
> repo. That is the setup I've mentioned before, at:
>
> https://github.com/nkadel/samba4repo
>
> I'm afraid that whether mock on a particular operating system handles
> a local file:/// repository has been a bit of a crapshoot, to make
> this work on some build hosts I've had to activate a web service to
> enable http:// access to the local repo. My setup includes building
> some nginx.conf.d/ files for providing just that, as well.

And oh, I've not been publishing binaries because I don't have what
I'd consider a well enough sanitized enfironment to publish GPG keys
and binary RPMs from. Not that my worspaces are tainted, just that I'd
like to set up much higher security levels for a production build
host.

