Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D583201D93
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 23:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5YvJCKLYjpPBLktwqrcRl1UGe/Gs4nT/5sF76kLscAw=; b=ltbvY7yAfzZds6jh0X0ziyh+n2
	u0x0SMbq4njahrpDnlrqYwBtCGUXbOczDV2CNi93U9E5K4K5q/T6ceIJZHKbLCeZeZ7FV5jek1gTS
	jrDRvXYGgyYWTcPFTUf6OpRVtRhd8Wosyr4LD7WNLkWa0Ld3fDR22UI1z678KF+5p/chXiiRAzPcK
	jHKiCj5Jget3j1cbhOo9btEaS/rxi6STzPI09GaWxSXMv0P7ATwXMYEYckiZCqrG9XwvqPsli1EMF
	tZznOE92KS/m7n1OqPtmzkBaCqnNnOry9ZIHP9WEPKGdIoa8N5axnz1zf9cDBgGmb/D+2MIuDVAZs
	sXj6CpQg==;
Received: from localhost ([::1]:27926 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jmP19-001XZt-0c; Fri, 19 Jun 2020 21:57:47 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:38606) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jmP13-001XZm-1u
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 21:57:43 +0000
Received: by mail-lf1-x12c.google.com with SMTP id d27so6393338lfq.5
 for <samba-technical@lists.samba.org>; Fri, 19 Jun 2020 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5YvJCKLYjpPBLktwqrcRl1UGe/Gs4nT/5sF76kLscAw=;
 b=ok0ZABXJQGJMzO7CuVAWH5hilbVeGuRbvuT3cKBpENgsMZSu+USaWQg10mrwKzbBJs
 /OH5jONhW05N+vP+Nh1zA7gsIdUAEYSnnCe154eBeLp9yLouMrVlfyjDAFgSmdCbEZ57
 nLp1sXyY2ARC6+7VHMN1oexG6NR5xpM752S6w2NH3Oo5vSno89bjFr7vumFYJv33jas8
 MJDP9omoO8v0X25h0MRnJ2X3HpSMxOPyF+CIdVFM1VVmWXBJ6x1HPVNhUDbBmUHbSnO5
 aFxRVcnbylJM9kQzs+9CCLAI5s0uot3Y60z++dbSvJPGBomDbKXXeq8bQhVW0DVj4ZVi
 p6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5YvJCKLYjpPBLktwqrcRl1UGe/Gs4nT/5sF76kLscAw=;
 b=gB0I1UP2fO/rQMU3xBePLoY7fsa5AEP13OHyMJvUfYvwBVp0uWooEJin3rJkGlptmv
 1Mzytk2WyZaud+iJoAw+NLRinFT/iJuTqySxVR4XJnEDVBBNW4aeiRQqPDl7xQM/1n/e
 m4atOHnAL9ixsP5j1eaNp5tnAV72CUneuBsGAB4mPrTIwaHO1YEHeejt4cLJuHSAf+gd
 /sMKczAS5yIXHGrRqcXkgVyduEbV/8eavu7Sx8lh32raaveHBM+wtJ2roJbXPK668Y0K
 BxWnG53h/HgKTmaq3Rbyc/eTPq7tmNTjcQOIhzjScSoKUZKj504JoNSnXwCKIfEdWxuY
 QWTw==
X-Gm-Message-State: AOAM532Se9hP1DIj815CuyW3XVXNIJOtpJf9EZgaYFF7AHrdNeXJpVlN
 AM5Zr3RvPTSHQQaOFajRGwncet3RcQyikdZ14fNbgc6t
X-Google-Smtp-Source: ABdhPJyGz6+9wjOHqs6krcLrigQp7B8jE7lt5CLoUn9XhTw3Ed81ZQhRV0SQYBcQ59XE4qyIsO3JpTZ5LF6ZVW0a1Bg=
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr3065665lfn.30.1592603860089; 
 Fri, 19 Jun 2020 14:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8TH5sf6ekjfG5QqnEwG41fopV1bWOMxBH_UnodfjDo_qA@mail.gmail.com>
 <20200619181956.GF10191@jeremy-acer>
 <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
In-Reply-To: <CAC-fF8SYbXaz33yJ_QaZzeYh2uBt3iKxHzbQNtMPm5qqwvAciQ@mail.gmail.com>
Date: Fri, 19 Jun 2020 23:57:28 +0200
Message-ID: <CAC-fF8Stst7BnrEKVQLP7og-HLp=T+NNoiSpUmRD3mwxXtK67Q@mail.gmail.com>
Subject: Re: gitlab: testing of ldap-ssl-ads option
To: Jeremy Allison <jra@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 19, 2020 at 9:01 PM Isaac Boukris <iboukris@gmail.com> wrote:
>
> On Fri, Jun 19, 2020 at 8:20 PM Jeremy Allison <jra@samba.org> wrote:
> >
> > On Fri, Jun 19, 2020 at 07:45:28PM +0200, Isaac Boukris via samba-technical wrote:
> >
> > > Does anyone have any idea on this error and why I only get it on gitlab?
> >
> > My guess would be differing gnutls library
> > versions. Not sure how to determine what
> > gnutls library version is on gitlab.
>
> In the raw log I now see the host was "Ubuntu 18.04.4", i'll try that.

My bad, it was rather easy to reproduce, it only worked in my lab
because I have 'TLS_REQCERT=allow' in ldap.conf.

