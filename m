Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC018BFB325
	for <lists+samba-technical@lfdr.de>; Wed, 22 Oct 2025 11:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8ukEQaq0c5jeyNX3v0TzyCmPMq7VD3+tVPGRvr+djkg=; b=q5Lx4Vsg9umo1fa8YQ7W1MD+AE
	N3hBvjZh8rGZolS/59wddTJbV70i4/tTN/VbOsYM0BtLbaf/QtcJL2SH/uegYKTVZvWgSQvlIsVDl
	eO+Wf+yAnsluBZ2ap4HRWV5ZyCO7jhmSc54y7zCUT3fyosGMzTnJrrJ9jaZR3Zop3HeqHwXrPEMjJ
	79romYrCzSGYkDl2Y4KndELkIf8MDUX8NgN9tCvcjM0q7f37gHkh4yjwqLU93UoDiubiQTakS/law
	Tup8Rr5R/HFmSi+XXZj0Ih+fd4dEf3TN1LOxdgxUl8PxtjgCq37hD9ttmPUno2BVZm5VEh29cEfkF
	646YCCUA==;
Received: from ip6-localhost ([::1]:59206 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vBVKK-008Uh3-2e; Wed, 22 Oct 2025 09:40:16 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:43185) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vBVKD-008Ugs-TO
 for samba-technical@lists.samba.org; Wed, 22 Oct 2025 09:40:13 +0000
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-87a092251eeso10267906d6.0
 for <samba-technical@lists.samba.org>; Wed, 22 Oct 2025 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761126008; x=1761730808; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B7XGUkoweaSg16Up6jjogdkIKMgWk1WC/X9yYJ/JPnw=;
 b=SGuW6pSWX0Da18jMnHJDlm4g8y3JQRJCTmyNvsag0Eu6wr9NALOh9pXW6e9vLYLU6M
 OiAmrN6PC/OnNYnXUXa3EuNw0t45B38d962k2iAP6rspWcVnIRkE9N71syWpA7V9VVLZ
 uqybAdm3QK09GfhlumcL3iWUd6Srn7UA0hAjVSdDRqeNHtB5qGi6EbRYzJUZP5+bfO/+
 u2uvedTRRXZFTx/NyPozh75c12sGQtD9WJcrYnwET6yEw8f4oPAwUtq9PObAS9egWKat
 XvBLu/rnEDcc1tnjOwgHdUJk1ND89yB6Ozto/pyLglit+QGkYZpl5XGUKIZcA72q4rKi
 +VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761126008; x=1761730808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B7XGUkoweaSg16Up6jjogdkIKMgWk1WC/X9yYJ/JPnw=;
 b=M1RcHkwWfy+w/xw2pRpLUwPgHnjrCmikUagM3BEuhewLqxBVrClqcLsOV4tdVnFcZj
 fjHl6cHB8KvUXb6nQAKO8sQ4vRCDuz6kQS3Ez9RGlbLt2e/fQQ78AiITBFE9YnwnbBF/
 QZvrHGwB6hFM3xuYLxR9wl88O4Oen4vPriIYbHmSytEgrONhORP/MM8hYkF1z2XTIJ2E
 AIMR0KI32mF0TEUiowAjJvl7INLDO0eCqtxdEZJkjJpXG4qEc41BfLdBgD7hLKxZGJD1
 B6Nq2kS2CA7sooEnblgBI1+J6T2ExwA9oOGfpSl4jTNghnJi4r6aub2RMn2E9AZSfv3z
 HJEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/eOZDVUjoc+apJ9INGrDYK1hT577cUUBk+Nmc+gSYznBh5oimg90LRKWTXK12ag79rxOCqKIzw5FlZHAM+wY=@lists.samba.org
X-Gm-Message-State: AOJu0YyhaOujgunDE8qZ0jfRi73POhmcsdRKODZBujBrmV7D4gPvI3bF
 dNUiX4l2BvMS9IwyU0LDRtTZFHiyTTZhAMLT9oLOygyD/yPJpTn0SYvxEqOSvVBD3cV8q+VhSr+
 1k0TYd+X3yFF4E56H4X8FIsMByEK9imo=
X-Gm-Gg: ASbGncsX/YhPT3ZEirL5X1u3ZJdcgnnUujJcQA430A5trbIZXOcyP2Uo+GzIBYY5Uzk
 ggQP0W1GuLXvjxza6IG7Pbf9TVMMu37mhqD23M1aGGU2AN/4vFn6kNWyHbVYzVopJMpldxVxwI8
 Pm4gUpj4dI/IG1zR4gK9GKExBE8oybd8wu5wxChTE5ScAi3vrlpzbKWMRmM+TV9gFMxvBRJV8pU
 RaaC40HQushbPs4tGcBJzJnOucS4n/vdY3braDiRjT0VKVduqNZeQzJdTJFjr2DvpHScTI8D+Kw
 YK5liB6Qu3C9Stfm62XLs1uoMdfgyadbvet4AdfT2lB+AAVwtkabBAPX2Gx7TPkwwZW3mROjdzx
 MaJtXuMbRt5SbJUD0utXtb2GCO1wVn1COSc2bjncfvw7VD2V04RZcQEcXUhdnY3WkuXGLveqbd6
 cVJB8tHGo/
X-Google-Smtp-Source: AGHT+IE5PAr/eOHHtDcl2NGpBfle/70/rxDCMRJvlwp+EvoZWMQ6xz+l4wmrUPDgFkCb+U+8enAXDKJdEXuZsBJiBDQ=
X-Received: by 2002:ad4:5ced:0:b0:87d:fc0c:a62a with SMTP id
 6a1803df08f44-87dfc0ca945mr10281396d6.18.1761126007956; Wed, 22 Oct 2025
 02:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAEAsNvQmV=xFsU-4jn9zC2DYoAUjXTS3qcsGNe7XUZEEXg1cLg@mail.gmail.com>
 <CAH2r5mtCjCvYphEAWir9PtxWQUy51jiir2Lk8erubUetX8TAbQ@mail.gmail.com>
 <5023741.vXUDI8C0e8@magrathea>
In-Reply-To: <5023741.vXUDI8C0e8@magrathea>
Date: Wed, 22 Oct 2025 04:39:55 -0500
X-Gm-Features: AS18NWBSurwtqfUT5MRdlQNoudWZSg9St-5Cjl-wlfvaSGHkr72JkBWmaBIZ7Xk
Message-ID: <CAH2r5msCZJ5=QWJCZYSEw_AUL06a0=uguv1V=TcTGbVYLzJ4ZQ@mail.gmail.com>
Subject: Re: mount.cifs fails to negotiate AES-256-GCM but works when enforced
 via sysfs or modprobe options
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Thomas Spear <speeddymon@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

That was a typo, I meant encryption

Thanks,

Steve

On Wed, Oct 22, 2025, 2:02=E2=80=AFAM Andreas Schneider <asn@samba.org> wro=
te:

> On Tuesday, 21 October 2025 19:45:17 Central European Summer Time Steve
> French
> via samba-technical wrote:
> > Good catch - this looks very important.
> >
> > Do you remember if Samba support gcm256 signing?
>
> We support AES-128-GMAC signing.
>
> AES256-GCM is for encryption not signing.
>
> --
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
>
>
>
