Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE843BE57A
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 21:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=S1m4TFrP1FdGBf/LbftBZJ6uT9pXVfHLDa2WBVTrOAM=; b=pavrj/ynYgzTziFboJYgY2spy/
	CXtR4+zFknQdngCzd8coDmM67EqBxlvR3c6Rqni+XDrXn4rBIQ78nCMwPy0fiDQUammHg3plYETtj
	svPcDbB+KlxsyUlyb3VA4+djvTaTzOIlE5oH1y6K/Jz3lYOWVr92SIXW7bNCGS5MaM3b+OMF1LwZ2
	SBdAntppG54Rsp6/dlhQxZN9NRdutEra4duXSNO5aE/wbOz0lfrzx2fcMU5FKSpYRFKYuej0onwNK
	cm61h56ZrWsWHb2fElPa6qLJLYcqAC9E8MpEWKdgCUd9V7Hm6bB4+Vv1CFB3CMkV+HBdoRglIRrpX
	r7kccwBg==;
Received: from localhost ([::1]:64764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDCmW-008cqb-QL; Wed, 25 Sep 2019 19:16:56 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54309) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDCmQ-008cqP-Tp
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 19:16:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id p7so6960167wmp.4
 for <samba-technical@lists.samba.org>; Wed, 25 Sep 2019 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S1m4TFrP1FdGBf/LbftBZJ6uT9pXVfHLDa2WBVTrOAM=;
 b=hqKjK2PgKL3t2mnV/ppDn7R0CwOhiqrmHs+IzyHAQf3RF7W1wBjKIYS1z+V6AZ72R7
 7KmsRIwCrrvSODAmqWiXdI0QE700mMxIgifT6MIAInuO9nGhAtD6rSVMsqrjgWQ8TaT0
 axOmvI5FknjTow+ROWhgz7fL8DhnFZM5zS8iKY5c1eW+SyGssu/vJ6X+kvixjYuxh2cD
 N06IcMuB+Ej3uDDgHcViCB79+VQNLEZ68zigzAxHSSAz+hFCF/zNtzrLjhH/Z7D/LQw0
 /yETNd4RPRn6RBx/Vw9I9cbcrfVwEtBBI0P8JFZ9Hw9EQAG+kPSk367nsFNR6BBAVCdp
 05wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S1m4TFrP1FdGBf/LbftBZJ6uT9pXVfHLDa2WBVTrOAM=;
 b=WvNOcpr4AadbzodZJVgUHnrmQCSMg6nkID6iI+sZhQvplRYxaepbLVGwpXuulXGiSB
 B/RKpRkNbG44JKV23ojFq1upcy/5ahYmHgfaSe3CPkhe8QuivVcG8cneT38g1OGzytHG
 sJeyaxkD4yz1g/zC0xPqDstK0cV0pmJx765Im1J+ddRS9rjZOMSUG0aQuOZ76R7bMZyR
 SD7tzDdanYMAcEzMWxyvQORzLjDyb2kooqkT8wz+ggWHXDyX+tPz9e4XRcbIfx8p1mms
 z6oGVTulwjVJuW4uB97q7JmZf+iB9dCJrGo3Cb3NA6G3EtiVhZxagvUKvAsbM+oovk+D
 1UxA==
X-Gm-Message-State: APjAAAWTpcrUPM+haf6V7+0AUOYTxVbaPPd9LKLvhYgSaHBUzFbNI+JM
 nsyF4r1vsUTpVn7msw/k1/750ViWFNzPVWtDmt/8p/Wk
X-Google-Smtp-Source: APXvYqyGKgO3j+sAtZQna5SOlDYOTu0cikNIrLib94VYECk4I75/x3m/VV3QIyOSO2EDtOzUdSSNQ6aiGrM/s222g6g=
X-Received: by 2002:a7b:c764:: with SMTP id x4mr9319450wmk.138.1569439006485; 
 Wed, 25 Sep 2019 12:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPwcp54B_LCJ_2gnXHZ63OvkTkb6MM+CX2GRXteRi7wyCA@mail.gmail.com>
 <3da181cd-74ac-09ca-d75d-f23adb159ec5@samba.org>
In-Reply-To: <3da181cd-74ac-09ca-d75d-f23adb159ec5@samba.org>
Date: Wed, 25 Sep 2019 12:15:38 -0700
Message-ID: <CACyXjPyqhvZnKaDai=zGJ6zfhEKPtS1fte8468Mm7EX0czNQ2w@mail.gmail.com>
Subject: Re: Writing a Windows Explorer plugin that uses a Vendor Specific
 FSCTL to access extra metadata about files from Samba
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 25, 2019 at 12:03 PM Ralph Boehme <slow@samba.org> wrote:
>
> On 9/25/19 11:53 AM, Richard Sharpe via samba-technical wrote:
> > Hi folks,
> >
> > Over the last few weeks, as a part-time activity, I have been writing
> > a Windows Explorer plugin that uses a Vendor Specific FSCTL to
> > communicate with a Samba VFS module to retrieve some of the plethora
> > of extra metadata we have in our file system.
> >
> > It also allows us to set some of that metadata as well.
> >
> > Since knowing that something can be done is often the most important
> > step in doing that thing, I thought I would mention it.
> >
> > I hope to find the time to provide a tutorial on this subject as well,
> > probably on the Samba Wiki.
>
> yes, please share as much as you can, ideally the source code, but some
> tutorial on the wiki would also be nice. :)

My Windows UI skills suck, so the resulting UI is not great, but it
does everything that is needed.

I plan on documenting the calls to be made, the library I used, code
snippets on both the Windows side and Samba VFS module side as well as
hints on the actual workflow.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

