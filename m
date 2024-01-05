Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF6825280
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 11:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Gb44fTIgEdi0yLr1EDmBghItXqfgERfBvFUpqork+jM=; b=Oh7MYb89VkgJJ6gj71oRMy8G3U
	fq5WdAsn8iszD15tB8fWp2or5PEU6MQCUD+EHXTTt8/776207elcP8iAGC8qRqoXjGAglmJwFF9Jd
	jrb51XDYHWmGAMtGR9U1GPEHIL/PVPoXFSrIu4MomNsVy3l5eHujRAP7zcVqIIiLrypgiKFu1h2ZE
	lqt9jxCmTc820i7hzitFhToj9JqPV6hRkm65AIdRVafef1aYBVeoN4VsSRNf4ZqOsAC9QyG9ByR4J
	9DN6+nVfF0wIEgrEwOJM8cSvj0EXCA2+uK518Kmc2qJXvhigSDrN/FkqIid6EYGXWfL9x62RZqIyx
	5dYuilyA==;
Received: from ip6-localhost ([::1]:47100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLhuV-002TxO-11; Fri, 05 Jan 2024 10:58:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:45481) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLhuF-002TuP-PM
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 10:58:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50ea9e189ebso1490910e87.3
 for <samba-technical@lists.samba.org>; Fri, 05 Jan 2024 02:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704452306; x=1705057106; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gb44fTIgEdi0yLr1EDmBghItXqfgERfBvFUpqork+jM=;
 b=RTW76OltyDzgpD5am9V+Xl4uN5ohbOm5bxgUMFrd7g4WYup6Jlg2sjlNK7UAp+MBMU
 0WJwaT7AeiNw2jwZoHrsUV/9eOIek9pqESk+MTTzGYs7F9oZup2T0nmqeyjHlZ8lkxWW
 bM6Y0LQpKQ+y+sqaXblVvQUDOxExsvpu7r7vC7iPDX6QGp9H+aQBfdb4zznX77jhf4Wv
 u1BwEpiP/wFx11JHp8ukNLdMok7NlGHpQsc2TL8tpBO866Y92A5te5EE+VFfUBKDkMft
 aVOXLhcRe31pak+2c12DG3zhwtlYvFhhFso/I0WmbgJNTEazTQo6Qo0PMhHzd2/mRnXa
 rCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704452306; x=1705057106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gb44fTIgEdi0yLr1EDmBghItXqfgERfBvFUpqork+jM=;
 b=N8VMxk7qwxWN3URSqrpkKRcOhsGpr2jbGkjeDDXyywDPCHl7pc8Ome5MVi6cdj9l35
 GsGVZ368DJmVSDxn45SN4MEMG+fYcu2FDPnDJ1D4oIWi051s87dOVGjM40d23WUdJypW
 P3N8RS9gyI8xpcKX6GFBtzokkE6iTY9BFZr07OWGIRcvOTQl9/RCqACh3CMWJmEprxe9
 lmGbGv79icTdoFflReTna9kG+PbRZoSqjhJiwIx+u+JvgaEJZq14AZUohjrfHA9RcuM6
 Fe+5/+Xff5qh5EbEoOdArc++BYzO2ufiud1C6r7/I+As3OaoCcG6Wqd05Snb6IlfBHKp
 mo8g==
X-Gm-Message-State: AOJu0YxVGqXatjUG9DAK47WiBxD2olIhR9sNGIjpZpHh1sBdZwNbEOdr
 faID9sgCo4oqX9/SHrpo1h+J0D2WnQx+mbeMegY=
X-Google-Smtp-Source: AGHT+IE6ct4zrcBkfNLJVtjXK/Z7EmGqAPGLuSAbL/hbTvhyM16GZBdyioYdCVXUPAAIFpcrSThNCFwJYK//XentTk4=
X-Received: by 2002:a05:6512:685:b0:50e:3904:4f0a with SMTP id
 t5-20020a056512068500b0050e39044f0amr1185633lfe.9.1704452306138; Fri, 05 Jan
 2024 02:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
 <CANT5p=qqUbqbedW+ccdSQz2q1N-NNA-kqw4y8xSrfdOdbjAyjg@mail.gmail.com>
 <242e196c-dc38-49d2-a213-e703c3b4e647@samba.org>
 <CANT5p=oFxQEB5G4CzVuJBkg76Fu-gqxKuFdYJ8NCnGkS-HhFJA@mail.gmail.com>
 <aee2e001-a1a6-4524-a897-de293ef1c034@samba.org>
In-Reply-To: <aee2e001-a1a6-4524-a897-de293ef1c034@samba.org>
Date: Fri, 5 Jan 2024 16:28:14 +0530
Message-ID: <CANT5p=rB4dtk7jp3cP9Wda4J2eG0HcEjGDOt9SCOpx=ho8DzRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
To: Stefan Metzmacher <metze@samba.org>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, sfrench@samba.org,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jan 5, 2024 at 4:08=E2=80=AFPM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Hi Shyam,
>
> >> Maybe choosing und using a new leasekey would be the
> >> way to start with and when a hardlink is detected
> >> the open on the hardlink is closed again and retried
> >> with the former lease key, which would also upgrade it again.
> >
> > That would not work today, as the former lease key would be associated
> > with the other hardlink. And would result in the server returning
> > STATUS_INVALID_PARAMETER.
>
> And that's the original problem you try to solve, correct?
Correct. I thought you were proposing this as a solution.
>
> Then there's nothing we can do expect for using a dentry pased
> lease key and live with the fact that they don't allow write caching
> anymore. The RH state should still be granted to both lease keys...

Yes. It's not ideal. But I guess we need to live with it.
Thanks for the inputs.

Steve/Paulo/Tom: What do you feel about fixing this in two phases?

First, take Meetakshi's earlier patch, which would fix the problem of
unnecessary lease breaks (and possible deadlock situation with the
server) due to unlink/rename/setfilesize for files that do not have
multiple hard links. i
.e. during these operations, check if link count for the file is 1.
Only if that is the case, send the lease key for the file. This would
mean that the problem remains for files that have multiple hard links.
But at least the hard link xfstest would pass.

As a following patch, work on the full fix. i.e. maintain a list of
lease keys for the file, keyed by the dentry.
This patch would replace the cinode->lease_key with a map/list, lookup
the correct lease from the list on usage.
This would obviously remove the check for the link count done by the
above patch.

Reason being that we already have the first patch, and I'm not sure
we'll be able to work on the second one soon enough.

>
> metze
>


--=20
Regards,
Shyam

