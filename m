Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F951A6C77
	for <lists+samba-technical@lfdr.de>; Mon, 13 Apr 2020 21:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=i1icakGBVdU/jELuR3bVefTlCn+rElTdmIirsZBow64=; b=uwOBO1Rzpfumzm/vqXLaULJ3JK
	KyjJK73ha/PR6w2e376Pa16C9AX6bsvhdxB/4rYYDl/1HN34rArzgrRu3vgsq6Tv2lz+TFQpObbCP
	f+5TKbeBSRftBE+gOMrhZp7toJ1ohsMVlquP38Xu4v5BSr+pxQfnt622658N941Yz51f11yNKLtWK
	d/8DuBcMA9wSt62rc5XUmSkP6CNqM3FO6R28NOAHUUGLx9VKITDEo0O2qYoSu1aA0ebW7p4m+Si1A
	1EctFjXDQnG+5swDcGm8hTQjpY1DvkNJ8cpsEc2FYOtE3bnmvqyvqkzcsel69UdiYAx9jztitHXkl
	V0CTzguQ==;
Received: from localhost ([::1]:54654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jO4kS-000day-1X; Mon, 13 Apr 2020 19:28:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jO4kL-000dar-AT
 for samba-technical@lists.samba.org; Mon, 13 Apr 2020 19:27:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id a81so11142196wmf.5
 for <samba-technical@lists.samba.org>; Mon, 13 Apr 2020 12:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edu.singelland.nl; s=leerlingen;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:in-reply-to:to;
 bh=i1icakGBVdU/jELuR3bVefTlCn+rElTdmIirsZBow64=;
 b=Z8Om58w+ivcpIstkg1pcLXfjp/Fcptyfc6jZE7BEWeJZY9V1UN2CnpkZsLzaHZS+S+
 Hy0F2smJMp4hGdF58ESXzckVt4EBEGxZ7dGvgaVmdaSfrzVV87hF//uvcgxQm4PIIXX5
 RSJ/a1PYgaPx4AzpmxzdmlyLqmtYVAcLFCCAQfpYRHfmU2N7tDCg1ob7kR09Hw+6QptO
 +MM+2X+VdSmkiUMxZ8yEmADvKrE5HomRhWsvxe2zJW4iRVOzOzhIGmR/Yl+c7Vruu9jM
 fqfvYWUrCTjxWAey73T/PcSAAsi3ahqEcrf+YbVRSNZYchXBBDn561HkQJqMQna1FPWR
 vi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:in-reply-to:to;
 bh=i1icakGBVdU/jELuR3bVefTlCn+rElTdmIirsZBow64=;
 b=OhT47aA0P+WM1uSsVp/cs8RrwOTUdJ3QGDWiElqzaYiPPf/AsopKh5MDok3vJh88Ct
 ztlQQY7Tck4hVc0lBhGbIS6VXmTeML62+TW34J+Dpj1t8eDGq8XBUH3m9wGxPc21+EAT
 9F9RT4gXYrk/MRF2yMdByVkw7ofmjvaoptJpHJ717v7qOJclOned16xq7lEKdz0qaJwZ
 fR64OJQzBIYqpeV2WDZriGez8pRqkEScIzTuyVWwXPSoGBJNTyt6eM/5Aru+4ks2Hh6l
 UD4KQEsvzttpOGso5ax+89CuCBPVm9Bl6M53nvM0IOK8T7466yr33HE9BNjehh0HFCuJ
 82nQ==
X-Gm-Message-State: AGi0PuaOG9phHzBeEKblU2neZFl1lrm7ZKs7PsDuTiASVWLaF1mqux4N
 uFAmaI0EwQgTkIJcjkFV1/q5P3TWDWs3
X-Google-Smtp-Source: APiQypLbdi5Y434XsZP+El3/16fA6/U/rgFCJMHUS7Z5LF5mm/yOrOJFJn46igTrHY3f6G3QZPGuXQ==
X-Received: by 2002:a1c:3c08:: with SMTP id j8mr17553677wma.30.1586806071685; 
 Mon, 13 Apr 2020 12:27:51 -0700 (PDT)
Received: from [192.168.0.52] (ip-217-103-42-226.ip.prioritytelecom.net.
 [217.103.42.226])
 by smtp.gmail.com with ESMTPSA id k9sm16059418wrn.89.2020.04.13.12.27.51
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 12:27:51 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: samba-technical Digest, Vol 208, Issue 10
Date: Mon, 13 Apr 2020 21:27:50 +0200
Message-Id: <DA77E830-62F3-444B-B403-6692EB35833F@edu.singelland.nl>
References: <mailman.12.1586520002.86114.samba-technical@lists.samba.org>
In-Reply-To: <mailman.12.1586520002.86114.samba-technical@lists.samba.org>
To: samba-technical@lists.samba.org
X-Mailer: iPhone Mail (17D50)
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
From: 130273--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: 130273@edu.singelland.nl
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Kap hiermee

Verstuurd vanaf mijn iPhone

> Op 10 apr. 2020 om 14:00 heeft samba-technical-request@lists.samba.org het=
 volgende geschreven:
>=20
> =EF=BB=BFSend samba-technical mailing list submissions to
>    samba-technical@lists.samba.org
>=20
> To subscribe or unsubscribe via the World Wide Web, visit
>    https://lists.samba.org/mailman/listinfo/samba-technical
> or, via email, send a message with subject or body 'help' to
>    samba-technical-request@lists.samba.org
>=20
> You can reach the person managing the list at
>    samba-technical-owner@lists.samba.org
>=20
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of samba-technical digest..."
> Today's Topics:
>=20
>   1. Re: tldap search paged (swen)
>   2. Re: tldap search paged (Christof Schmitt)
>   3. Re: tldap search paged (Jeremy Allison)
>   4. PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82):
>      rec->value_valid when connecting to samba (Rouven WEILER)
> <mime-attachment>
> <mime-attachment>
> <mime-attachment>
> <mime-attachment>
> _______________________________________________
> samba-technical mailing list
> samba-technical@lists.samba.org
> https://lists.samba.org/mailman/listinfo/samba-technical

