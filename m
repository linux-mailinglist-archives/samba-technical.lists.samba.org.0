Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF98B22C71
	for <lists+samba-technical@lfdr.de>; Tue, 12 Aug 2025 17:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=zBNBPeWmdTUj9AyUwwQGngZgGPDwfIOqizQOa8aOPE8=; b=vMlA8Q7Y2uN2nK/8OTHjfwY3CO
	MvyGnBSQFDi5uw9hPN4HTeh8ilesuXbl5XV2He9+UC3HNAa/kxNIv3qnqDzRGit/Us/HsLANOFlnG
	XgAWN3Pf/zBusRdi2Sb7VpjKr1LdT3PSp6AbDUMyIwGgn5iTjzngqc7ASyL6C5vtzT6z2bWkAFI6J
	4no95fJ1ve9fWdv9dLf6LRpHcnSUrWeOv+l2MD/ULwpF/MfXr5q8Ud/PeZEBXpHtPl5G80dgxDN8u
	O4/PJyDJEZoA+FgqBhVUGYiS2cDZLWHWsxBCa6O/Q1LmqwfUNvkQIN2Xx7n9D7CuXgMrjDrry8mtt
	FqD5gyYw==;
Received: from ip6-localhost ([::1]:37674 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ulrOm-00Eusn-6J; Tue, 12 Aug 2025 15:58:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31669) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ulrOg-00Eusg-CL
 for samba-technical@lists.samba.org; Tue, 12 Aug 2025 15:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755014322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBNBPeWmdTUj9AyUwwQGngZgGPDwfIOqizQOa8aOPE8=;
 b=Qifd9NIsa7mHsMxne8Cz4il7n8RtA2KACbISYdjJ6ckp4b/R0GoSmZLPq49KNLVEkYhUQ/
 3O1nQeoYJAoq0KgfxFDFK96Zh4OCnF96VXt8ekKKOyTnQGj4F8xZ4F/PNxqgRr3NY75LXs
 pD/B3dLMCw1KlDkqxLIxfZySrGZxEuY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755014323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zBNBPeWmdTUj9AyUwwQGngZgGPDwfIOqizQOa8aOPE8=;
 b=AhKwiRSZNIBA2DV7Pql0i68bgQG9NJlmhn9R1lqetOKtoB9SQZribKPLHjsqRWg13qpDMz
 oguqa8ifY0RL9KYEqRgtHOuFJOBso29ITDXus08S/liblMKKw76HpQqw1GzKQ9kVBIgWHr
 BLtrEOHT+/kjEKCcSEppu/QHPjoyAas=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-Ry-QD18-PwGLSLRfVWOxNg-1; Tue, 12 Aug 2025 11:43:06 -0400
X-MC-Unique: Ry-QD18-PwGLSLRfVWOxNg-1
X-Mimecast-MFC-AGG-ID: Ry-QD18-PwGLSLRfVWOxNg_1755013386
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b07b90d5cdso70651971cf.2
 for <samba-technical@lists.samba.org>; Tue, 12 Aug 2025 08:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755013386; x=1755618186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zBNBPeWmdTUj9AyUwwQGngZgGPDwfIOqizQOa8aOPE8=;
 b=dLRkQ/AhquV5rMhYRKucuuCegoRoE/WAdE8VIk1di3HqvavldHjKkqu3G+7etnEEcx
 3RgkMr7WQUqfT/jDiseM10eQfjUGnNm6yProH2G5ZQT12kHL4g1HDWJpjkasRCZeY7TE
 BnLpBiYcZ5OfHROgzeKMrKvPOsfe5jDsZWrzCe0/D5JuiaELh8ai9fxoMWRhcSTU/tpt
 fYxN6tlQt6hymPGawIqY3Z76xK+gJ5lqlCUKhOoZ7pEgCiQIeaREKDmFnHfU3mRYXs1s
 k3VGobqgYko+LoG10Xqc3fDiYHZNXEWWp3MR6medCIlXEYygJTF90j8RunDTyPSt4ZPY
 TezA==
X-Gm-Message-State: AOJu0Yzvhal106jHMRuN2tgaibSnvCabfQhmge5+rkl7t646WQ/7V/Xk
 MfKuSaizq8EIrR5LXNahlwBtPU0BcNXPXMeQSqgCLzzpY8uSGOVBKmNdtGWofYRsb2ts7DCNzKU
 nZ73GcexBH+gYusgpIc5DBLykzTcTV8GE39RMHMKlsPMgIZA9M4s90bciieXi0wLXYSHdna8k63
 56MKqeieNcD6wDaVu9xOoiiB/y1hYb+nXtiAU+4LW/o3IT
X-Gm-Gg: ASbGncvQyhcdVPkmuwPbvZU2ZO0WLFzrc7sJ5604WblGDgVt37/QuLHSZDHUMDttNf9
 /S6VlJf2273PFN8AsCc6aSnhmNc12j+mT1XId8CPj0+Bki00K5b6A07vb/578iWtKih+U14tURq
 UQQ6AmdBakklwuazsWz9HNQdWww0qvwIZ3rNXqEmD3SQvNZIKVsudX
X-Received: by 2002:a05:622a:59c7:b0:4a9:ab9b:65da with SMTP id
 d75a77b69052e-4b0fa7cb355mr1061011cf.13.1755013386121; 
 Tue, 12 Aug 2025 08:43:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM2vam+ATel29LtRq3EOGhbtsq5JO5stshIhN4oabvNepAaWpkZ5Y5y7P2QLsu3dJ2lW9uoZ8GxWDbDJv1eD0=
X-Received: by 2002:a05:622a:59c7:b0:4a9:ab9b:65da with SMTP id
 d75a77b69052e-4b0fa7cb355mr1060461cf.13.1755013385590; Tue, 12 Aug 2025
 08:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
In-Reply-To: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
Date: Tue, 12 Aug 2025 18:42:54 +0300
X-Gm-Features: Ac12FXxw2VoLmFXyICqI8FlShJNNMX_CluMcZOUuqW5ConBcNWr4vxyxEpzK8NE
Message-ID: <CAF8sLVUU2S1i0H4xj-ruUN1njoHgNZOW17U6WW1g3B-FksZ3aw@mail.gmail.com>
Subject: Re: 4.23.0 WHATSNEW entries missing
To: Jule Anger <janger@samba.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UOWc0oyDm_qMRq8WJY7_MWyZ8YHxRX1fdAxGLa2Hd_g_1755013386
X-Mimecast-Originator: redhat.com
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
From: Shachar Sharon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shachar Sharon <ssharon@redhat.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jule,


NEW FEATURES/CHANGES
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Per-share profiling stats
-------------------------
Starting with Samba 4.23, users can collect profile counters at a
per-share level. This feature requires building Samba with profiling
data enabled and adding an appropriate `smb.conf` parameter for
specific shares. It's particularly useful for deployments with a large
number of active shares, allowing administrators to monitor individual
share activity and identify potential bottlenecks or hot-spots. When
enabled, users can inspect current per-share profile information
("Extended Profile") using the standard `smbstatus` utility.

Currently, this functionality is supported only by the default and
`ceph_new` VFS modules.

smb.conf changes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Parameter Name        Description  Default
--------------                   -----------       -------
smbd profiling share   New             no

Thanks,
Shachar

On Thu, Aug 7, 2025 at 6:34=E2=80=AFPM Jule Anger via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi,
>
> the WHATSNEW for 4.23 looks pretty empty so far.
> If you have added or deleted a feature in the last six months, please
> send me a description to be added to WHATSNEW.
>
> Thanks!
>
> Jule
>
> --
> Jule Anger
> Release Manager Samba Team  samba.org
> SerNet Samba Team           sernet.de
>
>


