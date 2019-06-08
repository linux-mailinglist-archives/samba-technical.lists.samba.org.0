Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5550F3A1E4
	for <lists+samba-technical@lfdr.de>; Sat,  8 Jun 2019 22:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=z+mJlA42Dth++7CIkmE9uZDf5ym1tFnPSv8yNiVBmuo=; b=q/yVB6kov5vhxHsyGZQxf3ow6x
	j9seenlrvh6uCYpuBDplyXap41F2lW6FmXTEOsWWMsIGP63rlWz44NF7mrwUg75iaJ91VjKdnk6pf
	u0mblZ9lUfteFADaif6e8FEltK11L80SA/WTr358eGvwJ4RkW/OnYknWpt+Sb6cizXmrq9e1nlXv6
	fs2/04kjuRplx78XKE42y7EKBGGsOdEPsyWJu1cxUIlsOUvqNs0cnT3v5D6Mzoj+iwf8LbalQKaen
	rE3jJoFte1A0J/D2NPPZyjRcb/hf6uELN6iGq8Spa3B47Z/Tj1sgyciPz9Hbd7IHZXzdBgUHm9Vdb
	HarBq8ew==;
Received: from localhost ([::1]:63086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hZhn5-000Y4g-4b; Sat, 08 Jun 2019 20:18:15 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43932) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hZWsD-000VPl-Md
 for samba-technical@lists.samba.org; Sat, 08 Jun 2019 08:38:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id i189so2469983pfg.10
 for <samba-technical@lists.samba.org>; Sat, 08 Jun 2019 01:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z+mJlA42Dth++7CIkmE9uZDf5ym1tFnPSv8yNiVBmuo=;
 b=bLlrBu86Yew8btIs8ORMa3bf3BLAEwpWPsnFrIpcm8+m2hijLFdVI5v6Y0pzVMReVY
 FEPi4HjQL2wLs4/+/SicNW/azbc6HCTJKMRkFXkWVaq+UJvZ+sBj88skntJ2zNHBJ5G6
 Bx3aJYKwWjrvv8Wu4Rfs+jQlRdqeTdzaZphcQv8PhqWEt3+UTNUwSt4PuHDs6doZ4DWl
 9Ay6UFgLtk3FNeU0fShlIQPldMwlKAyfTRkA/w71rSOBtq9JXpmFq8MdQeHLYUWgJ/It
 xqC16MK4hbgEatFby6en5h7JLBnuusXtvgwnK2Qm+Yliahvhivv1iYCXps0hDNFWV7b2
 sWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z+mJlA42Dth++7CIkmE9uZDf5ym1tFnPSv8yNiVBmuo=;
 b=NxC9uh9+6P6VnltB5PYSe9kLmk7o3jTQMZCzjcKksp6V+2mgeHYoe31uazoc8kq2k1
 QrnSJcI8DtmyMYYWks9d4exbPyK5mgDJ8/oQYHHcHkalLXE+gkkqrQ1i3+48fs+MK7yL
 TGqfAeZv3EPaMgS+SNoyPu/jqvO/GZ2jmJ5F+AcIzz3hMgcaaNrY3Ss8yiz092MLXXkL
 FvLNWYg7XwbOE0yaK8XuwLnlh7kx8EW9I0ljHKicphWK0ha3zXeQ+laHTeV0+LF1hHEE
 4AmpxKtoKxxuw8HbTrnwgERcDQZ9xvcGmIHvmaKyL5gQCvnHt9irxIJd5kua7Joj7JXY
 gnmA==
X-Gm-Message-State: APjAAAWaeAHfc/nV5UYTSEB7I83/kOD/9/YMgC91HWbBMKhBm78/1Ww6
 TUPf2kcJyryxnkQu2cHKSWWZGJeWT6cr3K4biYQ=
X-Google-Smtp-Source: APXvYqw5iF+3OI+efxaBYjbWvG8YqtW3YetT+zsO1K3IrmSl47Lkab4mzpc7cD5IczFJ/z+FF8kJN9NJej1/QQWeLUs=
X-Received: by 2002:a63:d4c:: with SMTP id 12mr6843387pgn.30.1559983124137;
 Sat, 08 Jun 2019 01:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvA3t2Nm4F=LuBwHkN+E19pHuiLaSv0JV9SMNYvZrxAiQ@mail.gmail.com>
 <CAN05THT93RGGqECaQjpBJzo7cQWyxfsSNh-3nX+WqagjeZN8wQ@mail.gmail.com>
In-Reply-To: <CAN05THT93RGGqECaQjpBJzo7cQWyxfsSNh-3nX+WqagjeZN8wQ@mail.gmail.com>
Date: Sat, 8 Jun 2019 03:38:33 -0500
Message-ID: <CAH2r5muoekqamNPRGZO52PZb+fDuKp1-MYxhGgBjKNv--AqkkA@mail.gmail.com>
Subject: Re: [SMB3.1.1] Faster crypto (GCM) for Linux kernel SMB3.1.1 mounts
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

updated and repushed to cifs-2.6.git for-next

On Fri, Jun 7, 2019 at 4:24 PM ronnie sahlberg <ronniesahlberg@gmail.com> wrote:
>
> First patch, fix the comment :
> + pneg_ctxt->DataLength = cpu_to_le16(6); /* Cipher Count + le16 cipher */
> to
> + pneg_ctxt->DataLength = cpu_to_le16(6); /* Cipher Count + 2 * le16 cipher */
>
> You can add a Reviewed-by me.
> Very nice!
>
> On Sat, Jun 8, 2019 at 6:24 AM Steve French via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > I am seeing more than double the performance of copy to Samba on
> > encrypted mount with this two patch set, and 80%+ faster on copy from
> > Samba server (when running Ralph's GCM capable experimental branch of
> > Samba)
> >
> > Patches to update the kernel client (cifs.ko) attached:
> >
> > --
> > Thanks,
> >
> > Steve



-- 
Thanks,

Steve

