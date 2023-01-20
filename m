Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80662675DD0
	for <lists+samba-technical@lfdr.de>; Fri, 20 Jan 2023 20:18:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=H/cuYQVaURot8NIlqMJUqupZS5spnQh7yyTXLiHNfhU=; b=JY8uZ3UEAuByAP6IOXbSddtBoP
	2Cn+7jySmcDJnSSbybTdp+z7NirQ3ofls56YJTAWht5Lt8pjof3mnSyOE2tlGZNsHbz6RtuSZUOr/
	QBNYVwedeTR/gHfsJn8XtQSq697BUZ1GCK3z1aAz1CoGL+CbZgRFd2iT4kmCdwhik4nj8Yvjcc5SK
	83ovd/7Hb/4p0Ufr71CEyLa1ViADt7CmnHo6r/sy6qR8HTQQnIGLz6qR7wv5pxcWKaA7HVmNwvwXg
	4chJ4gI8qRl/D0f3lFUuJOXjcYkWZscKPZTBXuOioHQxObrZ4dB5t4q6ierx/jIfuqKb8Ys8i/UMo
	QdT5zUNg==;
Received: from ip6-localhost ([::1]:27296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIwte-001FGb-CJ; Fri, 20 Jan 2023 19:17:54 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42751) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pIwtW-001FGR-6E
 for samba-technical@lists.samba.org; Fri, 20 Jan 2023 19:17:51 +0000
Received: by mail-lf1-x136.google.com with SMTP id y25so9472540lfa.9
 for <samba-technical@lists.samba.org>; Fri, 20 Jan 2023 11:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H/cuYQVaURot8NIlqMJUqupZS5spnQh7yyTXLiHNfhU=;
 b=mUSBsA4ivUOd9hDrc/Q+1wcozutzyFiR/YmikIHJEUbbVDf8o0xN3+8Oov1DAVO+WG
 vmntJbVPVVbyRIDg8inIvphDQ0Lyj4KP3iMmUevByl5NkRf8aECxJN2V/jn4rrkwSudB
 XOuhp4uRFUPnBp0EeAfL4NoC0G4Kx85N04jt8wfZAc2kkQoeVC0DdceGjpHvKh/nQGku
 +e/hcNxoEVibYMAuA/ydE2x+XSr8MavunnOPuL+TAq4dbC4RbxkP2QXQKJ6oi8IVBfpj
 AkICQ22WBYy7ibkz7npNcqbAafnXvebT6i6kh0KT3PJdLHjhKVdmOZF+J5Wxlo6CuDiT
 7Mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H/cuYQVaURot8NIlqMJUqupZS5spnQh7yyTXLiHNfhU=;
 b=gdRjEFi8OC9zsThSw8r/Q1zdOfwWEtb7lAjyZiRfcDzVPOEu8raZERXMvur15HKCP1
 c3/5TgK3XsNY+csNo9LUxa3+M35+bvhQwiuBDE3oSGnPC//XDFvf91TFrKn2ILritznf
 792gE33aAxxfQmSmoZvScRmQkzl5vRB9qIBM+hbpFltr1EJao+MUchbkJXTBzkHnmihN
 ufSZ7BuCjOR0hhu5joVZoG2oH85Gbzv8TH6a+ZDbV2wZ5gWRKGgylpnjUPY4pQ+QMKSu
 0N09xzdmEAIiAD0jwsdsZEsyMPq4waiwTcMU8cZYgWn4r9QjKru3Z3DAMI3YhsDANKRe
 DKHQ==
X-Gm-Message-State: AFqh2kq38ncQ+N68wJyalU/oLD25iAm0omJNbGa/IF+MzkO9oQklbhgY
 +2amJbv5eCTY63JyDpuvnCRfrHJIh1AUfGuSrX4=
X-Google-Smtp-Source: AMrXdXug4pUchE3u6YNTAw2d4BVLoA7vmgLoDUMjasMHua3CVAbiQmCJQ3cnUdMG/jAU+IFw62P/GfRs94HmhtWAbXQ=
X-Received: by 2002:a05:6512:3142:b0:4d5:7f50:d596 with SMTP id
 s2-20020a056512314200b004d57f50d596mr1493734lfi.536.1674242264561; Fri, 20
 Jan 2023 11:17:44 -0800 (PST)
MIME-Version: 1.0
References: <20230119111853.596560-1-arnd@kernel.org>
 <CANT5p=r+FB87Mx+Je6Xeo1-q=Cu01Mx++jR-=UegFYRtEtpBmA@mail.gmail.com>
In-Reply-To: <CANT5p=r+FB87Mx+Je6Xeo1-q=Cu01Mx++jR-=UegFYRtEtpBmA@mail.gmail.com>
Date: Fri, 20 Jan 2023 13:17:33 -0600
Message-ID: <CAH2r5mt430q49cGO=JvF88w_DMu7qua=x4KNER_5qN46=_jv8g@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix debug format string in cifs_debug_data_proc_show
To: Shyam Prasad N <nspmangalore@gmail.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-cifs@vger.kernel.org,
 Enzo Matsumiya <ematsumiya@suse.de>, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Thu, Jan 19, 2023 at 7:48 AM Shyam Prasad N via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Thu, Jan 19, 2023 at 4:55 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Printing a size_t as %lu causes a warning on some architectures:
> >
> > fs/cifs/cifs_debug.c: In function 'cifs_debug_data_proc_show':
> > fs/cifs/cifs_debug.c:478:75: error: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
> >   478 |                                 seq_printf(m, "\t\tWeight (cur,total): (%lu,%lu)"
> >
> > Use the correct %zu format string instead.
> >
> > Fixes: 962a0fd04791 ("cifs: distribute channels across interfaces based on speed")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  fs/cifs/cifs_debug.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/cifs/cifs_debug.c b/fs/cifs/cifs_debug.c
> > index f5f07019fc7e..2e644d926e62 100644
> > --- a/fs/cifs/cifs_debug.c
> > +++ b/fs/cifs/cifs_debug.c
> > @@ -475,7 +475,7 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
> >                                 cifs_dump_iface(m, iface);
> >
> >                                 iface_weight = iface->speed / iface_min_speed;
> > -                               seq_printf(m, "\t\tWeight (cur,total): (%lu,%lu)"
> > +                               seq_printf(m, "\t\tWeight (cur,total): (%zu,%zu)"
> >                                            "\n\t\tAllocated channels: %u\n",
> >                                            iface->weight_fulfilled,
> >                                            iface_weight,
> > --
> > 2.39.0
> >
>
> Hi Arnd,
>
> Thanks for pointing this out.
>
> --
> Regards,
> Shyam
>


-- 
Thanks,

Steve

