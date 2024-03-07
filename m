Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6479A8747A9
	for <lists+samba-technical@lfdr.de>; Thu,  7 Mar 2024 06:37:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GIrvpzBTukWFdsGEEJPsX9FRjzXiM/mO16C/Fo07irw=; b=CoHFuk0wLEd2NRxcevCOPDROAm
	Vc5/ptzKTcss7nHFeRklPKNwaeRKTFcTWu2tLqS4MNTSTFU+DFkGEgsGYDRHkNCWuRw1xpvFf+4Gj
	oCvhPYPC1DgDXY9BXMOOvekf9adH7qgMoDmaNxrWbsuhQiswgmdN4Augf97+C6rqHuIUkq3+S1eQP
	DSMK5JNCbbg6Co4ZizuQUQOTMA2rMSMzHF8ijk6PCgu6eSfMhp9q1PkrWXuJABrbMs9mBBYeFv5uI
	3MY7/v07e327EG35ktWmLBvuBFwF/e3zEvGkUa7Z3Q7gNRkvycfML5d/8y4JJjHe+t43WNf905OKE
	JiqkZQLw==;
Received: from ip6-localhost ([::1]:32336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ri6RB-00BynJ-89; Thu, 07 Mar 2024 05:37:01 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:42001) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ri6R6-00BynC-2X
 for samba-technical@lists.samba.org; Thu, 07 Mar 2024 05:36:58 +0000
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d2991e8c12so5506761fa.0
 for <samba-technical@lists.samba.org>; Wed, 06 Mar 2024 21:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709789811; x=1710394611; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GIrvpzBTukWFdsGEEJPsX9FRjzXiM/mO16C/Fo07irw=;
 b=Ypcek1bu01rtcMttSCjs7mkdlrE76C1023H7mze14KMw9WAegibBpJdQ9hp9654Jk7
 jvKLnFMWiACHmfyyr8l6EK+38dioEAk4di8bhfeTsbNiX9uAJJTn5OJZuVJXeQn46XrQ
 nw0sBQl8Gc0J06C5/kjfRaUjWtqtB7JJo7cX7beGLR2z4vN0+IEW6D/lUcXf4zEuYZxz
 1G4IjL3EEdiRB6G758BDnwd2TNfAv9xTudVggh5gKI9pHN7TX6xSAa2BwBzsq9MLcUGb
 Feo3TkhaoGuL+08pWM4WBHSiLi8yOR/MfWkAllZCt4YkQx5zKpK71lwdJ4wM5FWbIVir
 p7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709789811; x=1710394611;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GIrvpzBTukWFdsGEEJPsX9FRjzXiM/mO16C/Fo07irw=;
 b=R/wVuoS/KzEwKr6XxuisISyi79ZdOUeXmSdUbYB7n++sLNuaojalcmBdABUZZ32wlQ
 6J9OaW1vaF8o/Vit6McWezjj/iEpgDl3bnwx5EMFiViGs8nBXcHUW2ROBYZBp70lR0ID
 9N95VTfT/5YB6hDnGGNnILF5/v6SSKa7Hrv1SH9wJrx8hhIE3QSHrA7XbxKEVaaj/aet
 Ru2EribLd2x3gSQK2GKKiSRu+4ZkX0EgZT/0sqqRFt6hs0aysUU2mN0XjNYkl6A17FiK
 PwBL/i2CHo4xwHhGi0eG+XabB7tqfjMRuG4WAv9D8z8Pnky5My0qHHwUX8TOUPLBpw/B
 M6rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXUlnpO0d13aa7UqXuHEu1u4ZgRSSS1hgpBf/UUR2vW/e8CvkawD6jktiafnF1rlj+PE8+76NWs15YeGA+vFIBCjjmfvJM7ke7lUSja0K4
X-Gm-Message-State: AOJu0YzJhTust0BJn1jrF3EkkiC7niWwlzgk9M4m7LyJWKWxzVXWpyDI
 my3b3rB426FTPIVo/QtCly56iDO24H1NfE8TvPq6gFE/AwktpLfQpT5NYSQWd7VppWXq0Uzsrg2
 KaBG4ooSnEiwoA14Xzpbp/qOeQNA=
X-Google-Smtp-Source: AGHT+IGERnrC50EnykrFQjVM4vn6b1mtVwkcZVLvrVDE4u7GblPYyzsRtKs2PMhLIzAy2o7G0qix8B/sTze0/8spuKo=
X-Received: by 2002:a2e:9915:0:b0:2d3:3999:bba9 with SMTP id
 v21-20020a2e9915000000b002d33999bba9mr117741lji.21.1709789810782; Wed, 06 Mar
 2024 21:36:50 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 6 Mar 2024 23:36:39 -0600
Message-ID: <CAH2r5mutAn2G3eC7yRByF5YeCMokzo=Br0AdVRrre0AqRRmTEQ@mail.gmail.com>
Subject: [LSF/MM/BPF TOPIC] statx attributes
To: lsf-pc <lsf-pc@lists.linux-foundation.org>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Following up on a discussion a few years ago about missing STATX
attributes, I noticed a case recently where some tools on other OS
have an option to skip offline files (e.g. the Windows equivalent of
grep, "findstr", and some Mac tools also seem to do this).

This reminded me that there are a few additional STATX attribute flags
that could be helpful beyond the 8 that are currently defined (e.g.
STATX_ATTR_COMPRESSED, STATX_ATTR_ENCRYPTED, STATX_ATTR_NO_DUMP,
STATX_ATTR_VERITY) and that it be worthwhile revisiting which
additional STATX attribute flags would be most useful.

"offline" could be helpful for fuse and cifs.ko and probably multiple
fs to be able to report, but there are likely other examples that
could help various filesystems.
-- 
Thanks,

Steve

