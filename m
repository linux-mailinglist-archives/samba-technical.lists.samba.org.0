Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A535B53977
	for <lists+samba-technical@lfdr.de>; Thu, 11 Sep 2025 18:41:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8CEuhmT2TGRh90Y0SMjWcHVE+X24aGylacLLctg9AQs=; b=sV7HgNjMH+LLwgez5SJ8192/rb
	YRcxLdU2OSk0U3SNrJE7x8l0qbPTmn9gaYiJAPhx4biLcQQCl4atV5dFkuiPa3sc3fH4A+Zv8mOVU
	TYqRmPmwPCn8Ycay87QPkGGpkfpRsEqfSpBou9iz7im0FQliEvspTzj/cChhk4OJK1re12chKdmhO
	W9d6PkUVG33nZdnKYpTBFmnkovGYWaMkIVPQXMYKrPVZZ94J+Z1nLDOE4DLDFXFCwZTea7BSfquPJ
	dlEWzKvCWw5q5DkA96qAcD9AjzEToD9Ic83rn62t9PLit2QvlmAfvgIXkpw/MXnM/3IRZip2/Lt97
	2kqlh1fg==;
Received: from ip6-localhost ([::1]:50272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwkLU-003ZCm-9w; Thu, 11 Sep 2025 16:40:28 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:49518) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwkLM-003ZCe-Rh
 for samba-technical@lists.samba.org; Thu, 11 Sep 2025 16:40:24 +0000
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-76637441569so3450746d6.3
 for <samba-technical@lists.samba.org>; Thu, 11 Sep 2025 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757608819; x=1758213619; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CEuhmT2TGRh90Y0SMjWcHVE+X24aGylacLLctg9AQs=;
 b=fUHljh1pjPYFwQHVAMe0XlTjSL2IDIVklArILujlJrrjNbXHb6Q9BK9Nq4BRN+jJUI
 CjWx65V8ZKWTZJr/5K/91clhnprlYepimGFgW8T0wzafL60OzfhjeM4pqaBtVyIdoksP
 mYaTTY1/G6u1zyZx9l8eEc3nhTfG1yZBGLAFi4iWYe+cCtqSNy+tw/Efe/DfJu2YYxkF
 30wHLXyfnGVSzLFUT9Ne8zN4BHMmXucBkBWLK99F87RABH7QB3b2cPX2sUvLM6r+OIcR
 PLS5aMM5NQcuO0Xbbu1YO0ZG5XeqcVL2nh16e4vdhtC1gm+rzjmVNHi6VIV/vo3jrQDw
 C9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757608819; x=1758213619;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CEuhmT2TGRh90Y0SMjWcHVE+X24aGylacLLctg9AQs=;
 b=aWd9ZHUCMP3GoDVjSUpMLchPqYZHUX8MYOkVX5UI2Zo1z9ritE7b54JwLyhSUNUr6F
 nQkfZaoZn3MOyBVoo5bBHRESHBjuOQNvhmlqiYzKYJtPcnRc6fjpi6Sutnuy95ItfoDp
 lU0xt1RBkFR9v+UrGnOaSY5i29rYuTL8nQB1gXU8rR4HF383WVJQb8y0/8BIWrhvohs3
 Jo+rC72Hr8w1P3woiLY98dK21gju0CyW0/piJDVyKP31+PCJ+7/yUeVpQFUKsi/0Mt0s
 NrL3WEanfJIspHiJ8Ws62NNIfXwtrFUDZFKe4pfGX3m+A70JbL5ZNjgMTebCFlujKxlt
 u/ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuCyppazfl258O/b1QrmgaJNFaR1QF5bXA5EXuy8L3BR61tTh6W/2zB6GtshEdEebuC27fBU6hLPTi+WSIy7A=@lists.samba.org
X-Gm-Message-State: AOJu0Yzuu/NnB0xOtHkilJcZR6B+eJ0taKFtmIpoFI+yM9uNAdrB62v3
 1yxTfYxvjFI4HM92OnF5raRszQ+D1FK6UuoiyvjxaWsPfwg+Bf5sPSkZuvlAj312r39hxJvnX79
 ELVE1dVJix7ehABZGwvFRgVATfhjReNk=
X-Gm-Gg: ASbGncvZE3coQI1Tqa2XK6ZQTeC2164SGnZRqM6YnuPKPqEw4DZxHZiPCoDSwFShxHX
 BwUADf/sHTKC6MzJv2ZBUrisRT+5OwOjx33/yRUykGvq1xnk1ex+J/EN+XMayviOfUEAqphAGIt
 Pc5kYgcUqUrdS3lEydwjOuGQRm/yC3mCm3AUy6J2IbBQOx15P8JVK2S34pZCoChcce/E1yqINCI
 QlUHb+gDH4TUXcCFIY3GwVyTmSQqPq9DPriJyK1Vt+zTfRNmxN3Z83M5TUXG57qc6rFMMKEs0cz
 SYIMmqewAcp+AciOeefPpPUkCc6UVMUIw5gWfQGuJaDxSsRCIOdOL7ksFw7laBvjhaSmcnNZ+cL
 N
X-Google-Smtp-Source: AGHT+IEAtsGZFrgDNY+c9vGU+p/qVoy7EW/SoKlNux3P9BX3cE2kZ3I7YEdflt0WDHN8qbekyDOqEe2WxwQwtiTvn1E=
X-Received: by 2002:a05:6214:2a4b:b0:70f:a780:4f0c with SMTP id
 6a1803df08f44-767ba27936dmr287596d6.5.1757608818669; Thu, 11 Sep 2025
 09:40:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250911030120.1076413-1-yangerkun@huawei.com>
 <2780505c-b531-7731-3c3d-910a22bf0802@huawei.com>
 <2025091109-happiness-cussed-d869@gregkh>
 <ff670765-d3e2-bc0a-5cef-c18757fe3ee0@huawei.com>
 <2025091157-imply-dugout-3b39@gregkh>
In-Reply-To: <2025091157-imply-dugout-3b39@gregkh>
Date: Thu, 11 Sep 2025 11:40:08 -0500
X-Gm-Features: AS18NWCewpWCSHfzBtSTHTp1RP1-tK66_C66H-R8_RBjpUv1KeGAJtEDwSkTTDk
Message-ID: <CAH2r5msDcEnbkGT3y7--Dbk5pWWyTnDg2PLO_R4WderLfC9Nnw@mail.gmail.com>
Subject: Re: [PATCH v3] cifs: fix pagecache leak when do writepages
To: Greg KH <gregkh@linuxfoundation.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, ematsumiya@suse.de,
 yangerkun <yangerkun@huawei.com>, samba-technical@lists.samba.org,
 yangerkun@huaweicloud.com, lsahlber@redhat.com, sfrench@samba.org,
 dhowells@redhat.com, nspmangalore@gmail.com, stable@kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David and I discussed this today and this patch is MUCH safer than
backporting the later (6.10) netfs changes which would be much larger
and riskier to include (and presumably could affect code outside
cifs.ko as well where this patch is narrowly targeted).

I am fine with this patch.from Yang for 6.6 stable


On Thu, Sep 11, 2025 at 6:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Sep 11, 2025 at 07:09:30PM +0800, yangerkun wrote:
> >
> >
> > =E5=9C=A8 2025/9/11 18:53, Greg KH =E5=86=99=E9=81=93:
> > > On Thu, Sep 11, 2025 at 11:22:57AM +0800, yangerkun wrote:
> > > > Hello,
> > > >
> > > > In stable version 6.6, IO operations for CIFS cause system memory l=
eaks
> > > > shortly after starting; our test case triggers this issue, and othe=
r users
> > > > have reported it as well [1].
> > > >
> > > > This problem does not occur in the mainline kernel after commit 3ee=
1a1fc3981
> > > > ("cifs: Cut over to using netfslib") (v6.10-rc1), but backporting t=
his fix
> > > > to stable versions 6.6 through 6.9 is challenging. Therefore, I hav=
e decided
> > > > to address the issue with a separate patch.
> > > >
> > > > Hi Greg,
> > > >
> > > > I have reviewed [2] to understand the process for submitting patche=
s to
> > > > stable branches. However, this patch may not fit their criteria sin=
ce it is
> > > > not a backport from mainline. Is there anything else I should do to=
 make
> > > > this patch appear more formal?
> > >
> > > Yes, please include the info as to why this is not a backport from
> > > upstream, and why it can only go into this one specific tree and get =
the
> > > developers involved to agree with this.
> >
> > Alright, the reason I favor this single patch is that the mainline solu=
tion
> > involves a major refactor [1] to change the I/O path to netfslib.
> > Backporting it would cause many conflicts, and such a large patch set w=
ould
> > introduce numerous KABI changes. Therefore, this single patch is provid=
ed
> > here instead...
>
> There is no stable kernel api, sorry, that is not a valid reason.  And
> we've taken large patch sets in the past.
>
> But if you can get the maintainers of the code to agree that this is the
> best solution, we'll be glad to take it.
>
> thanks,
>
> greg k-h
>


--=20
Thanks,

Steve

