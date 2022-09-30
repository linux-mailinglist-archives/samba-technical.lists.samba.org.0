Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C255F0D66
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 16:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ceBoo9Xu5lL/LOQmRd/4t6hCG+4IOaeeyZgl90jBrF4=; b=AgMc8a8GAKnzywdOd/GJtaNOEF
	QwRVEhC3EEKdJCaOSzyYU8VBVQM7LG24SXXjbCLLh2/vVhDzcViP53iPBpH1FZftwopYgvh3r7v26
	fgfstIoCgy60ccJN4GRMrd8rWJxvf//845K7ABzZ7U5n7JGES3kD0GY4r40nEuYIeQsRBVYiFJrIe
	ovLHDjYv2skeoa1Af/LyhA1YumjO7JfOna/h2b//d+5dPCO7sZID9Y7FDmwF0QmMV4+y9T4TpkhyT
	cTKyCob7ASUrg5HrxZrR/nOyzESQ1A17dow26GuBsHFhN3BZCE690QfQBtf1JANO5FgCbmmOudz+6
	0wggX2Rg==;
Received: from ip6-localhost ([::1]:42720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oeGsK-00561a-Rx; Fri, 30 Sep 2022 14:20:25 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33709) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oeGsE-00561R-BP
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 14:20:21 +0000
Received: by mail-ej1-x62d.google.com with SMTP id lc7so9413496ejb.0
 for <samba-technical@lists.samba.org>; Fri, 30 Sep 2022 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=puzzle-itc.de; s=google;
 h=content-transfer-encoding:content-language:in-reply-to:subject
 :organization:from:references:cc:to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date;
 bh=ceBoo9Xu5lL/LOQmRd/4t6hCG+4IOaeeyZgl90jBrF4=;
 b=K2Y87nw+aRCJnMz2CC6EPVxAAJO9145KB6E6vkgoEW+3YEwmevu5+srHsZHsJ2Syop
 7k/lhrJrdJUmOsDbutGxNVazUHQapbhi364LK0TtK7HPQaxFh6/ihgKt4YrCq5vUNJXq
 bzgbgMTMi5C0gdDZRdefEQPFVbDvfWrKOgKjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:in-reply-to:subject
 :organization:from:references:cc:to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=ceBoo9Xu5lL/LOQmRd/4t6hCG+4IOaeeyZgl90jBrF4=;
 b=HXb1XSSKgAVj6UR6ErIsKFIlzm/Zcs2DgKy+z2LtUnKVrcGrfvNTHxhysBSLkrN/md
 fXqvnjzHeY9ON61NpeIJm4h56ApQBb3umTFkqmff+/5x8YxTEAmjFo+5Kf8S99hzovOV
 9Tshtp2TnTR2+l7fr8Atn0ZTLH9b86GwrfwU6ePJT/n+s0tuiiw+xr73FN5HaeDZa6Pk
 RpdvNlTdsvdiXLk68J1QJGM27gqpfa7NoatJHJ0PUFnOXS/+CSLJ/Miqp/MMQ4jyqzFj
 N7ziUvHn6ViOlXZG9g11Psi248d/dmcSvarWJLq8XDKfE+GLfBCeiVm94dx3U89l7Mzv
 z9DA==
X-Gm-Message-State: ACrzQf2kwv5uEnLh6db6PiMF8G/XX/YAp0T1KWqjCR+r6DpBNC/neK0I
 caC/ncPjwj6r2zl0Ah59loQyLXnzvk0rJSqU8LcaEAP0PjAlnzQkVRLQLRl5NUFarv2IPGIzxZ8
 Yp37tb30nFiNswdMrDT5xLAnFa5NNjQ==
X-Google-Smtp-Source: AMsMyM5PYqpy4vXK2FkSHXbDbMm8PX18ZYQs7arq3NvElfMx0mNr69S6Kq6uZlcJegg2PvyfKA0neg==
X-Received: by 2002:a17:907:96a2:b0:782:4072:19da with SMTP id
 hd34-20020a17090796a200b00782407219damr6490884ejc.398.1664547617136; 
 Fri, 30 Sep 2022 07:20:17 -0700 (PDT)
Received: from ?IPV6:2a02:8070:8884:cd80:d1d0:6e40:f97a:5481?
 ([2a02:8070:8884:cd80:d1d0:6e40:f97a:5481])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a17090603c500b007835316a1aesm1261435eja.65.2022.09.30.07.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:20:16 -0700 (PDT)
Message-ID: <c8dbc08a-0979-83e4-5f29-c8604c0322fd@puzzle-itc.de>
Date: Fri, 30 Sep 2022 16:20:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Ralph Boehme <slow@samba.org>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
Organization: Puzzle ITC Deutschland GmbH
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
In-Reply-To: <ecd8ac98-c8d7-43b6-b0c0-d6deb7352ad7@samba.org>
Content-Language: en-US
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
From: Daniel Kobras via samba-technical <samba-technical@lists.samba.org>
Reply-To: Daniel Kobras <kobras@puzzle-itc.de>
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 29.09.22 um 14:17 schrieb Ralph Boehme:
> before jumping to action can we also please briefly consider the Linux
> kernel mount case with SMB3 Unix Extensions and mount over SMB?
>=20
> The proposed approach makes sense for Windows clients, maybe be should
> incorporate exposing the raw namespace when UNIX extensions are
> negotiated. In the end this is likely going to be a made via a later MR
> in the future, but I'd like to see both cases considered now that we're
> making changes.

Fair enough. The current SMB implementation in the Linux kernel
unconditionally adds a 'user.' prefix to names returned from
SMB_INFO_QUERY_ALL_EAS/SMB2_FILE_FULL_EA_INFORMATION. IOW it already
assumes the proposed restriction to only the 'user' namespace, and
reports an incorrect name for EAs from other namespaces.

Exposing the raw (unmapped) name only makes sense if namespaces other
than 'user' should be accessible from the generic EA interface. Have
there been any plans to do so? For comparison, the recently added
support for NFSv4.2 xattrs is restricted to 'user' as well. As far as I
understood, that's because from the point of view of a network
filesystem, the 'user' namespace is special as by definition it is
interpreted by higher levels, and can just be passed around verbatim. In
contrast, the semantics of other EAs are defined at the system level.
They require interpretation when transferred between different systems,
and cannot just be passed through a generic interface. For example, even
if we restricted ourselves to Linux systems, we could not just expose
'system.posix_acl*' as generic EAs, but instead need a dedicated
interface that takes the differences between client and server (uid/gid
mapping in this case) into account.

So back to the proposed change, there's good reason to keep the
restriction even in the future. In any case, it shouldn't make the
situation any worse for in-kernel SMB on Linux because it just does what
the client-side code already assumes.

Kind regards,

Daniel
--=20
Daniel Kobras
Principal Architect
Puzzle ITC Deutschland
+49 7071 14316 0
www.puzzle-itc.de

--=20
Puzzle ITC Deutschland GmbH
Sitz der Gesellschaft: Eisenbahnstra=C3=9Fe 1, 72072=20
T=C3=BCbingen

Eingetragen am Amtsgericht Stuttgart HRB 765802
Gesch=C3=A4ftsf=C3=BChrer:=20
Lukas Kallies, Daniel Kobras, Mark Pr=C3=B6hl


