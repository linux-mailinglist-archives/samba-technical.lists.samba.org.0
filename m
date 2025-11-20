Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35192C74BC1
	for <lists+samba-technical@lfdr.de>; Thu, 20 Nov 2025 16:05:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6kRFpPUlL1GMv8pTQgs/uuj/dHi7IU+YUX5w8tOzD2g=; b=tGYvCDChf9kSloYzuERe678fPb
	HuJD/00/sC5jCLYI1OVL7N8wA4ISMNom8swFssxGzrwWYjJ3kRr5LRfdhdlc7gwpX6gFSlsSye73Z
	6rr+Ey7Sy8aMseRT2EDKR8uz42GaS+0QoXLMjjCOHnOXrvl+3ueYY8tBxtIyNrMt5A1CBDNHjOoLU
	a0qu5rDtyf+5iTUwpnz/9d7Fyoj8jdVrDasIvM82qdE7BVT+WpWAw2r85KMXFpPZnY4pEocX9rcIj
	zWpWWPAQDJUbLXmSyAWrkYkgOf/Qf2Dpqk4pNN3lGQb0Dx/ptU7NoLq69YdmrJ+iUttsN7MzoBAS0
	OKvcfqww==;
Received: from ip6-localhost ([::1]:37780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vM6DQ-00CmAA-NT; Thu, 20 Nov 2025 15:04:56 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:61761) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vM6DK-00CmA3-CX
 for samba-technical@lists.samba.org; Thu, 20 Nov 2025 15:04:53 +0000
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-880499b2bc7so8216696d6.3
 for <samba-technical@lists.samba.org>; Thu, 20 Nov 2025 07:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763651088; x=1764255888; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kRFpPUlL1GMv8pTQgs/uuj/dHi7IU+YUX5w8tOzD2g=;
 b=Gnd8U1uH6lTBOeIiPs+LtbNsKBgTwZ+CeWvYIlya+CG8gM/0E/1D4V0ndW/Qp/zDvM
 UKvCw8cY3No99B2paKl4mDmtMWrh7tc87eZ6oodprP2CUfgeMQXp3cCipmeStoPQLgEA
 7BEnEaP8KuNWvZqlFWC0DIHt75jgm3MFN6q+tLUwWNfmndM3LYjhIRKJNzmlunI8+y7Q
 sD2JWK9ug6E5W8AGX9q/D//krboJv6evUtLAibN1Z4C4qQTe4g19yuWRGU2X98DYBRZ6
 iEPF6PWUL4W3Qy4CB1MM73BnlK/8ZYPCX0fR0SFFjWEx3yTl1tGEG9jrfExTZE2q3P8A
 QKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763651088; x=1764255888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6kRFpPUlL1GMv8pTQgs/uuj/dHi7IU+YUX5w8tOzD2g=;
 b=DfLrLBpEdhfhGE0f5i3C1VodZbmmH81Wmydf1txTlPR5Hot4EOcq10aMGJ/VeWCZIc
 buFUKM+SKckj8CajjekDxKKTotfj74wCTcZleNjcVtg7Us5sWuoqoWBEY1eIClj2Jg2/
 vh9ejyQbcMrzt+mJqlAnrPg0h7g1l7sN7UCOdLErImlLGa2q5Qn1oK1elMPfTzzwmWim
 m/MxILEcaWNx4PK5pljkizqtQNk2OKpGqLIkCarXvgeTCsPYZ4CeAWnTgBUo97fvwVmP
 PY+Xh7YF1SKgOagRlAlTOCIQoWVYaw/gA28GpYQxzaqM8vljP65OvGDRmtChJDEqq6+r
 y1ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVolh9iRMtwVh6y7GnzvMFjP2Sc2aShJGrJdGMoAXRbmTFo0Ypzint8g/owvzF7D2HULs9rbmPevgFOkor+Pw=@lists.samba.org
X-Gm-Message-State: AOJu0Yzse2h1j8XwX9402bKk20XQqBjFFoygahFa/qqxuHIHJubhmoo6
 UN3bAbr8zIqXIvILICKSVQ4+7kyk3ccs4zxWA6cn9DCxGREuiYJd0/wTQTdQJOVoTpSSYU3Btvg
 FNrQcwkhcU4ZJvGGM5q3PZPxUOgaFpLM=
X-Gm-Gg: ASbGnctcnu9mCpTNsoyODaFL91cx3YXBVxd+ObeXqjBN0M/ecLXZ6B5GvD+qH6gvGvk
 rBwLcloOBLYVyrkziK+UuH8msmDnX/UdBWveV3o5st9SBdo7sEdwb+rrZqbk2b/6eq7JZLMf/H1
 vKFxXPGvIjFnPW5zouj33XPXsHbMwcRei81WdBz2JWU8EZ56t5ldzvhQktHgcsrBTT8nF8PxOEr
 xdeFCudyJdo45OY1U3YUe2K8ItZFUc5vKxRCN3JHEb8Wo+e4dfVYL3ODdZ/7FRSBj/13BnRtvED
 CB7S7X6h4zKkDco9yDiJi64j+qM5/r0RIpQaEfJnEOGZe/PZzS4LY1D0XfJwbUk1I0pNKFM31h8
 6ppkP7OGPqfSgG4mTzIn2UU/yAq4fiQTUeFK5aB+5sjpHN3MOp4CDlE4/4eKxWU01Kr/I3E6AO8
 8K3EYlo86zfA==
X-Google-Smtp-Source: AGHT+IFsKkXhYMhdtsra+P/p8EP0e3W7i7D0GhBHrYUlEp2ymhejSmkE+PNaMgkvA7xkNx/rrZIboeX4ZOKJeFtVYLU=
X-Received: by 2002:a05:6214:4903:b0:880:5279:98e9 with SMTP id
 6a1803df08f44-8846e131c85mr49130116d6.40.1763651088222; Thu, 20 Nov 2025
 07:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20251118022655.126994-1-rajasimandalos@gmail.com>
 <20251118022655.126994-2-rajasimandalos@gmail.com>
 <7mc3cpg6qojvq7hak6jvkud7xgynmaki554tgn2jic2y52onzm@ugw7wsq43wsp>
In-Reply-To: <7mc3cpg6qojvq7hak6jvkud7xgynmaki554tgn2jic2y52onzm@ugw7wsq43wsp>
Date: Thu, 20 Nov 2025 09:04:37 -0600
X-Gm-Features: AWmQ_blXfBEk2RwNC6znsiMRxvr5QE5e_9rCamPn7heku5OMDZrkh4jsUebDcd4
Message-ID: <CAH2r5msVd2Ygtfmp_9L-tuPUMT7pcW1aQxobHuOjtgYEWRgZ6A@mail.gmail.com>
Subject: Re: [PATCH] cifs: client: enforce consistent handling of multichannel
 and max_channels
To: Enzo Matsumiya <ematsumiya@suse.de>
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
Cc: Rajasi Mandal <rajasimandal@microsoft.com>, linux-cifs@vger.kernel.org,
 sprasad@microsoft.com, pc@manguebit.org,
 Rajasi Mandal <rajasimandalos@gmail.com>, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, bharathsm@microsoft.com,
 tom@talpey.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Nov 18, 2025 at 8:01=E2=80=AFAM Enzo Matsumiya via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 11/18, Rajasi Mandal wrote:
> >From: Rajasi Mandal <rajasimandal@microsoft.com>
> >
> >Previously, the behavior of the multichannel and max_channels mount
> >options was inconsistent and order-dependent. For example, specifying
> >"multichannel,max_channels=3D1" would result in 2 channels, while
> >"max_channels=3D1,multichannel" would result in 1 channel. Additionally,
> >conflicting combinations such as "nomultichannel,max_channels=3D3" or
> >"multichannel,max_channels=3D1" did not produce errors and could lead to
> >unexpected channel counts.
> >
> >This commit introduces two new fields in smb3_fs_context to explicitly
> >track whether multichannel and max_channels were specified during
> >mount. The option parsing and validation logic is updated to ensure:
> >- The outcome is no longer dependent on the order of options.
> >- Conflicting combinations (e.g., "nomultichannel,max_channels=3D3" or
> >  "multichannel,max_channels=3D1") are detected and result in an error.
> >- The number of channels created is consistent with the specified
> >  options.
> >
> >This improves the reliability and predictability of mount option
> >handling for SMB3 multichannel support.
> >
> >Reviewed-by: Shyam Prasad N <sprasad@microsoft.com>
> >Signed-off-by: Rajasi Mandal <rajasimandal@microsoft.com>
>
> It's conflicting because it's already too complex for something that
> should've been simple.  This patch introduces a new field + unnecessary
> logic on top if it all.
>
> cf. a PoC patch I sent a while ago, we can (ab)use fsparam with same key
> name, but different key types, so we could only deal with:
>
> 'nomultichannel', 'multichannel=3D{0,1,off,no}' as multichannel disabled
> 'multichannel' as ctx->max_channels=3D2 (multichannel enabled, obviously)
> 'multichannel=3DX' as ctx->max_channels=3DX (ditto)
>
> Makes 0 sense to have both multichannel and max_channels mount options.

We can't regress customers who use common mount options without
warning them for multiple releases that parm is going to be removed.

I don't object to changing Opt_max_channels parsing so
ctx->max_channels in fs_context fgoes rom a # to a combination of
number and something which can be mapped to on/off (for on client
picks default on the fly while for off sets channels to 1) and
removing ctx->multichannel - so if you specify "multichannel" it sets
ctx->max_channels to something like -1  (or whatever max # is) and if
you set nomultichannel it sets ctx->max_channels to 1

--=20
Thanks,

Steve

