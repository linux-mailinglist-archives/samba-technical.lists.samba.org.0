Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C70A4DCF46
	for <lists+samba-technical@lfdr.de>; Thu, 17 Mar 2022 21:24:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=9VWRzyry/SmtRouyWIKuZmdujzVfdmZHgD6RR1dY7hw=; b=QCiF2bdQkpoOGfdgBwfAVJZQxb
	BqqUXQVpmgndBPFEcJQ2cpEpq3tvsGVg0lUsuf01VRE4FbwRYbSE5qqhJAVBeWJuN+jtNXljm4yww
	/s076IOn/uhZEwoN83mFmN1Kl2nvp7tum8HpCCTKnc1FFAxT9cMAS0Fa4z8G0Q3Kh653wq8xn66Ev
	m5r9T4eKV/6/N/ie6WcxpONpbAlvKkiYBMi3MSvnUx0BeZqx1KlDw2bvKF7+FSxYa3Zq2MA/bHgRg
	nZMBXsgELCKS8209oG+eijpuwYoNMjdxMdOJrPkBJ4rKiwOGreqKWB+IU7hpsaXYlZKzGVvAHB/uK
	jzG2gimA==;
Received: from ip6-localhost ([::1]:37322 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nUwer-003Hy2-50; Thu, 17 Mar 2022 20:23:41 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52692) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nUwek-003Hxt-Bp
 for samba-technical@lists.samba.org; Thu, 17 Mar 2022 20:23:38 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D6E533F192
 for <samba-technical@lists.samba.org>; Thu, 17 Mar 2022 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647548606;
 bh=9VWRzyry/SmtRouyWIKuZmdujzVfdmZHgD6RR1dY7hw=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Content-Type;
 b=P18ZZgHLaPXUAhtY59/gQBKfhtKsHRgQy8gwbhAth3Pkv2b2rMIV/ogFczfcGL7G+
 rTXKAsrHPkR+mXv+byhxfmKws9V2D+W8/lSklvTVVNJ9taK93A8KyqA/YwuObYfLFc
 RazcRDWg73ThNenlQyaXlaEVkQ8q1+I0Eox52UB2GzXWp6luZ1vUpglSptVRKlDfne
 /vkoADCL1xz/loaUCnO1Vs84sRHNGaMea7FtiFx30QYhifGx2PhxIUaKGz/XC81pPT
 vm8FxgvvdVE1WUyuiyc6Umu64o5aW59LnyetvpaAfU2vlTkuNUAcufaxbObFlahnbL
 MEYzo6cegsOQA==
Received: by mail-ej1-f71.google.com with SMTP id
 ml20-20020a170906cc1400b006df8c9357efso2007216ejb.21
 for <samba-technical@lists.samba.org>; Thu, 17 Mar 2022 13:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9VWRzyry/SmtRouyWIKuZmdujzVfdmZHgD6RR1dY7hw=;
 b=Whj5wO1fhnnx9dNPrIVFc/UkiAf5CD276yM1gp+ga7L2uwF39Cv4uIUD8dYqAkZtkx
 fvybw607/YmmlI0b48RnT239ly8/fEtrggrP78V1zrmdck4eUGlcALl3GDkb2OGSILSG
 6O1wmysUeOMMn6cAb0mqvKDcwuBZaF++XQvEB9P9CCO2t1L3abfoPMjvCv6KHoboNc9k
 fK5aIwNeGirrev+QCk7DH2G2iP0yIK+TYobF0H7F+qn6f2PAnpA/fHydY4d8tudtQhty
 5p+8yKyBRKJV270BU2guOFe+UXSNKad3h5Cma2hL0UzGC46MsaOQAqdymKoD//TwZeGu
 vp9g==
X-Gm-Message-State: AOAM532hXTtyZ1mClHOVroohJQrhadF6agKjglhSvOi6MPivScbg+Xln
 c07xBeql3cznUkauRbvFZXI3z7QFPbvzgnzDoonIJQWXSsQ6ZtjEz6da5EOHhgHpZkxw7IQ0ME3
 iF1eNwofWt6vCL7gF1Do9R3y7szXXTNXt2xtWi3e4oy/RV0p2/ea33q28snOxSQ==
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id
 l8-20020aa7cac8000000b00410cc6c6512mr6327366edt.408.1647548606590; 
 Thu, 17 Mar 2022 13:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY7Nm3LptXDvclrKFpOro4y8KBA3sVZej06ziETg9t5rJz1Hhw2v4Ach/Uksu7pccbeHcqj2dBpXMJ+X4Yho8=
X-Received: by 2002:aa7:cac8:0:b0:410:cc6c:6512 with SMTP id
 l8-20020aa7cac8000000b00410cc6c6512mr6327351edt.408.1647548606366; Thu, 17
 Mar 2022 13:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <CANYNYEHpqsDONcd24SX3GxdRSX6FPR0BH7Ar9mizqke4Rk2T0Q@mail.gmail.com>
 <20220317112156.3abc7093@martins.ozlabs.org>
In-Reply-To: <20220317112156.3abc7093@martins.ozlabs.org>
Date: Thu, 17 Mar 2022 17:23:14 -0300
Message-ID: <CANYNYEFxEs8couhP-v9nZcJVTjHck1OJMZw14Bfxe7nMpMDWNg@mail.gmail.com>
Subject: Re: ctdb nfs rquotad: inconsistency between startup and checks
To: samba-technical@lists.samba.org
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

On Wed, Mar 16, 2022 at 9:22 PM Martin Schwenke <martin@meltin.net> wrote:
> However, this doesn't obey the principle of least surprise, and there is
> a design flaw here. I have overloaded the meaning of variables like
> nfs_rquotad_service. There is an assumption that an unset variable
> means it is started elsewhere, which is only really true for Sys-V init.

When you say "started elsewhere", do you mean "elsewhere in ctdb", or
in the installed system?

nfs is complicated, so many services, under so many conditions
depending on what is used and what isn't.

Upstream tried to grow some smarts into the systemd service units, and
many of those start somewhat automatically when needed (like when
/etc/krb5.keytab is present - which in itself is not 100% correct all
the time, but helps).

It must be a nightmare for usptream ctdb to try to handle all of this.

> So, choices are, in nfs-linux-kernel-callout:
>
> 1. Insert the following in service_stop() and service_start(), before
>    each "# Default to stopping/starting by hand" comment:
>
>      case "$nfs_distro_style" in
>      systemd-*) return
>      esac

Why does it matter if it's systemd or sysv in this case? I'm missing
that bit of info. ctdb doesn't use systemctl, or call out to
/etc/init.d/<name> directly as far as I can tell. It only uses the
"service" call, which works for both systemd and sysv. Are you trying
to support a deployment which has neither systemd or sysv?

Why not behave like basic_start() and basic_stop(), which just skip
the service if the corresponding service variable isn't set? Sorry if
I'm missing something, I know upstream has to consider many more
deployment scenarios.

In the future maybe these variables should be factored our into a
separate (or existing) config file, and sourced by all scripts, so
that site local changes are made only there, and not in the actual
script that is run, separating data and code. Otherwise in an upgrade
which changes the script (code) there would be a config prompt (in
debian/ubuntu), and I think in rpm systems the script would be backed
up as .rpmsave, and either the old script would be run, or the new one
but without the local site changes.

