Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 852318C4856
	for <lists+samba-technical@lfdr.de>; Mon, 13 May 2024 22:39:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=dLJaG3W4uuOQXq6+LTXVoEl5DNCsBCiQA9XiMEBiL2g=; b=IUq9Vo4AlknGU1ACcWTT0gh99W
	0Hk+VtI9BrJuxShh99ddkVRNvGAyTgFCNO1VfG6RiipH5dhHa+UuNBvKLzeOBOfeaTAgEq/zTiEn1
	zSx5yPZtwrLm5ULqV5zmePUPmVamSP8Qp6jbw/Amz2mYWEuUNj3C7XWGmMu92X2icVZvGM1Te5sw2
	UgwkAq9KBc6OZBXqfbWdWzAfCa1XTj2i44pbt146O7XbCqreBMyRxF0hdfHv2KeeoY7yaRC2fPSF6
	40s0msJ8VC8VY+pHaJ5sS8BT7h75FuK9i7Yot9qvmxKRigklL3lJ9E+VBl31JnQMy4k2Yz0IL1s56
	UazthuVg==;
Received: from ip6-localhost ([::1]:22688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s6cRp-008oEu-Nj; Mon, 13 May 2024 20:39:01 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:43273) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s6cRk-008oEn-L4
 for samba-technical@lists.samba.org; Mon, 13 May 2024 20:38:59 +0000
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-43dff9b28f6so25800831cf.1
 for <samba-technical@lists.samba.org>; Mon, 13 May 2024 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715632735; x=1716237535; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FpSgSGFAt6IaJXNpQUgqLrRYe5bxgq1BLfJIuzq/96w=;
 b=LNEAa6aphsO2zZLl1wlVSYUXpdSEgstDANMp+KKLkKnhfk/MoyvBjCi6s8N+sSXAnF
 YAACgDLP3hvfRhMkSkh8My1+AGYwRsj4NDd+dVhJBkuFTJp883/3gNdZabWEpy9W/VB0
 lbyr/pSemtjnBki+7SbcAt6Zf6mQsyBzzlfrt+O0EbCVtQQLaMirwH87oR23ugK/BNd0
 c4sxQbMVX0Z8c5wi2GP9HZGC/piiKctbqAIeliALFW/IqxaZerLRbglB5mC+Y8Jj+7Lg
 ZcVmtNyAxf4a3WoKwS/w+S00CxhpuH5HYWM+OyHyfyVcH2Cbz3/mXElmPeZkS4yjLA1E
 bsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715632735; x=1716237535;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FpSgSGFAt6IaJXNpQUgqLrRYe5bxgq1BLfJIuzq/96w=;
 b=j/jr9f6WaznnPBwFKSFCuPlGF5fiqxngjEqo/JxidGROSKX7PTljgagxEcdzCtT3iy
 aGiv468LVHqkZLrxZ16d2LKrmQsbxIQogKzmxDxOHp/YmtqFiqrlri4Wh0Y+qhfbfvEi
 rXwG9a9qM/prH29RGmw9kNw5BJ7IiAHcF1HT5uDxWFy2GcEcct4Chi84sHfsQVOnys58
 BgVdAZjclNvWBMndP0dEghjFgNLiqwUDlX+hF5Ko8mq9mG1ILX7yON+fdCnYJm4pr7Aj
 EWPhiscb/CYJN52O87OvH3iAT4ALxOUks+VB9bI/p/oNOmnKzXa4t1TH8Xq+DL193zz4
 o1yg==
X-Gm-Message-State: AOJu0Yy6+NZSzFiV2GdxYlt5TlZsB3cn8jgiiX7MFQcZh8xWxNvM/hMu
 c+QykNTY4IzGnO3pn92n37kUEN/0TP7vyQqM1PHxHL83aC6gHdWOdv110KFMB9BFKlGAR8ooySe
 E6Bfb6Hrq17mL1Mb3p9fCnKtCx8FXRr1u
X-Google-Smtp-Source: AGHT+IGWLIFRGRTa9164SdABc9Ikt04chrAmu4Wqi0phwUikf4+zjvJpx7gB9pUYyurhLJ0f1FTwoJ/Y1nwXIXxqUnY=
X-Received: by 2002:a05:622a:cb:b0:43a:e2da:136a with SMTP id
 d75a77b69052e-43dec297802mr224779271cf.26.1715632734697; Mon, 13 May 2024
 13:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAN4xyZOYsusPpMjOyUakgEsdjQQsXZRNTER-Jq4Zis20F6gKWQ@mail.gmail.com>
 <2708725.lGaqSPkdTl@magrathea>
In-Reply-To: <2708725.lGaqSPkdTl@magrathea>
Date: Mon, 13 May 2024 23:34:29 +0300
Message-ID: <CAN4xyZPeBgr=brqhfCrgZdcbQPEpsJyuacmdbxu3nnDR1DYpdw@mail.gmail.com>
Subject: Re: Openchange and last Samba releases ?
To: Andreas Schneider <asn@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: CpServiceSPb via samba-technical <samba-technical@lists.samba.org>
Reply-To: CpServiceSPb <cpservicespb@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks a lot.
You you brought good news.
But unfortunately I am not so familiar with RedHat derivatives.
I use Ubuntu server.
Can you place it to some git repository or upload it to some existing ?



=D0=BF=D0=BD, 13 =D0=BC=D0=B0=D1=8F 2024=E2=80=AF=D0=B3. =D0=B2 20:42, Andr=
eas Schneider <asn@samba.org>:

> On Monday, 13 May 2024 16:38:51 GMT+2 CpServiceSPb via samba-technical
> wrote:
> > Was anybody successful in building of Openchange with the latest Samba
> > versions ?
> > If yes, was it a git Openchage version or some customized/tuned one ?
> > And what was the Samba version ?
>
> Fedora and CentOS Stream are still building openchange:
>
> https://src.fedoraproject.org/rpms/openchange
>
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
>
