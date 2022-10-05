Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2665F501F
	for <lists+samba-technical@lfdr.de>; Wed,  5 Oct 2022 09:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UHE5t3RzuZq9XWIvg02NUOpVAjCk9hgPmV9IZeL6AF0=; b=jcgk3M1cno/tBiTI//un0tBcU2
	Rbaz5BC/3ObPrtfk0YrYpCE8F5qSxKdYH/FDnHVlYysPqtkgg8GYNGH+pknjbUUIOShYApVr6Qn+V
	Q0RG36UaVOmR+GQb8L3B7f4UThw7q2eJgRd5jPCvCeAo+WbVR6jPbqxTdn0TGX7WnOmsBC+/G9nWa
	Ixx3JDJ+4BgFVABmn3RG2LU4YojE35FJouhxBnBKaRnuGSqsRIEgc4fCfQSj6aflJjoP6c6e4+zJD
	ZzkR2fDGRDVl0HSOOCXKGv/Jxn4jdXPZA00gptI79HmHNGSRCAPD1BoVPrfNBM5Ao0J0KIUCqMcEq
	y3W7dkkg==;
Received: from ip6-localhost ([::1]:38988 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofyQ4-0001Va-SN; Wed, 05 Oct 2022 07:02:17 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929]:33648) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofyPn-0001VR-DN
 for samba-technical@lists.samba.org; Wed, 05 Oct 2022 07:02:02 +0000
Received: by mail-ua1-x929.google.com with SMTP id p4so3868961uao.0
 for <samba-technical@lists.samba.org>; Wed, 05 Oct 2022 00:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UHE5t3RzuZq9XWIvg02NUOpVAjCk9hgPmV9IZeL6AF0=;
 b=kP3f4YiUiDivevu4zAGXlYrKAOJlutMNKn6F5yIFF00YcICIH5rjJl0LBZT5GCCjsY
 69s/Bby2S72Hh7TBgL7MwHdMO0YQpgUh7FevpScA+LznPtgic6mmLxWx8UzxnKfRLKAV
 noMyp9oDFwwtsdzsxtp//jreujUdk889nkHGqvPg909Cp/3u12fgcN+CeroJg7y05qgK
 OXodXbrPEFrYc5ZJDbU/kvd7z9ZcivDaJ3Eude90UhwXHOZTQiKiQI1869Rc1KWBlzfR
 NSdzTujvLTApSxjzmBEQ3XMwKlaLluwAsp133cg9cK5dTJBw+NZjAY6OA5EMIkSx/Irp
 hDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UHE5t3RzuZq9XWIvg02NUOpVAjCk9hgPmV9IZeL6AF0=;
 b=3cBthWvM5yB/WpGbVia+KYzqXloDcVC1wDZZ0/kRR38tXFJ0Od8xlb+PUPX/7Q+JKa
 ZAkUTHihk5seI0XddIP0m0bkAWLLEVZBgdZqc+bPoxdAuw+yqiS6NmWRNoUjM37naq9U
 BMAlICsdF1q2HzSYAyEf6s4m7Du2MP84vNNZqRDOCpvxVLuhBneIc5/xmYefFBqkP6NC
 LoYjzp8HhlCnk7wNLUmPscbkJ0dwfAiG/bBg8rrQIkzv3ivNGchlQ6B8JcRU2NgRKvX3
 AgZF4TuNyNd1Ue83k3bclRL5ZZbnoCKLlHAoKWSNh/aXaF45mbGn6UaT922JPWjX7vZz
 rtbg==
X-Gm-Message-State: ACrzQf1DeROP/jyplNpYE7NPeT5keMFNMLURFh35OvSrBwmzUltH+CUH
 lLmUyqQXGNo/j7MMKgUnxdUXbplpw1lAYXDUhWA=
X-Google-Smtp-Source: AMsMyM7opRWyJTc9JIX5uLYrdIGDJWkxhKLOsdSnzRVdpu9POeg0Wb6Q0q1K2dyoWLvENxdOt6ZXyzNGD5uCI3sPYcg=
X-Received: by 2002:ab0:992:0:b0:3cb:c597:48ff with SMTP id
 x18-20020ab00992000000b003cbc59748ffmr14169017uag.19.1664953316796; Wed, 05
 Oct 2022 00:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <YzzjKyHDuFoQAVCu@work> <202210042006.9A12D208@keescook>
In-Reply-To: <202210042006.9A12D208@keescook>
Date: Wed, 5 Oct 2022 02:01:45 -0500
Message-ID: <CAH2r5muz9cGwtX5HF5wL0g9ix=cKs6C35BZObqMr6dgL-sOF-g@mail.gmail.com>
Subject: Re: [PATCH][next] cifs: Replace a couple of one-element arrays with
 flexible-array members
To: Kees Cook <keescook@chromium.org>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paulo Alcantara <pc@cjr.nz>, samba-technical@lists.samba.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Oct 4, 2022 at 10:17 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Oct 04, 2022 at 08:51:39PM -0500, Gustavo A. R. Silva wrote:
> > One-element arrays are deprecated, and we are replacing them with flexible
> > array members instead. So, replace one-element arrays with flexible-array
> > member in structs negotiate_req and extended_response, and refactor the
> > rest of the code, accordingly.
> >
> > Also, make use of the DECLARE_FLEX_ARRAY() helper to declare flexible
> > array member EncryptionKey in union u. This new helper allows for
> > flexible-array members in unions.
> >
> > Change pointer notation to proper array notation in a call to memcpy()
> > where flexible-array member DialectsArray is being used as destination
> > argument.
> >
> > Important to mention is that doing a build before/after this patch results
> > in no binary output differences.
> >
> > This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> > routines on memcpy() and help us make progress towards globally
> > enabling -fstrict-flex-arrays=3 [1].
> >
> > Link: https://github.com/KSPP/linux/issues/79
> > Link: https://github.com/KSPP/linux/issues/229
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>
> Looks good to me; thanks!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> --
> Kees Cook



-- 
Thanks,

Steve

