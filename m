Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE911FCE63
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jun 2020 15:29:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=xju1g0uWCLBpku2FJYuhjKJhhE5ibyrNut2eqc5+FXs=; b=jfIKc1+5iXFG0iw0372+Dp2kQo
	Sf6QXlQ3BRjoS+zlZeGrYUrOK1yFzkI4Ai92fF2wBTqco++t+H4j4Or9e36uy7TOKfacNv2SbDgGE
	bsAuNAerlZrg/UMSylt4vhvIa2dg5c4rtTaiH6gyP6Ayw25wiBZJmQjUR4OfyQPc+FAGR+PqKaoBh
	BlwsPgXz2z0Vi0How2gMex9GoHvjQwcnjogua/+fRvryvMOYhHGOEWXztbuhMU0AJ4aUxts/wlyN0
	9eW/Wav2Np5QEbLmTN8GUlsPESDiee5//gidCx5RdviseCG0ivBfnFAcT7YqeOZO1uEpNEIDyhQ68
	QI3ivtGQ==;
Received: from localhost ([::1]:26444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlY7S-000xFE-5n; Wed, 17 Jun 2020 13:28:46 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:41726) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlY7K-000xF7-Lk
 for samba-technical@lists.samba.org; Wed, 17 Jun 2020 13:28:41 +0000
Received: by mail-lf1-x134.google.com with SMTP id c11so1286482lfh.8
 for <samba-technical@lists.samba.org>; Wed, 17 Jun 2020 06:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xju1g0uWCLBpku2FJYuhjKJhhE5ibyrNut2eqc5+FXs=;
 b=F9jpLuzslqsZlUgTJipaP9TqmgBZNXMMykWu+hUN5m+lCRqvlnQGeLRBDdhhpUhG5W
 Tl2Dmf5Y+gFS/LppPmHMQFnNAeHQGJY6xNAjUa+zS9mWCw0OcQuR0I58WStTlGwQZxVf
 TcMUyIaOjQDWfkXZu95ThOzST82ajMuylU47UwK4HwkMsE9ldgx4V6q+Sh5cG2UPy/J/
 VyKcOJYCfXVyZZ8IbImBOaLmaQcP8iqMX8Cbzl1L7Gg0LEt8uNGNLGGt+pli/ksx2blQ
 zDRACGrgH2cgW25ALFRaVgPuVky7u4t3qWfdxJNi32vCGFsmhZWy9NuujqS7JtYGbVmw
 uS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xju1g0uWCLBpku2FJYuhjKJhhE5ibyrNut2eqc5+FXs=;
 b=UKNLKAPCkmlGO116cHynB4wmculQpp2weXXIxgO+iEhIvmaRGW8vnttkw4x88nxJZv
 93OMGOKGI28T1S9OZfUAGlO6nsd1d/gFNvbBckWsXco2nAxFAe3w+KfWOdq7CisDUd/B
 5Y20by6nA08QC8WwGKGLdTgZBgeJbrvoQBRPCv9c/fHIvzohf7h2qlnfJvc5G/V3UUOP
 SYTvf4VcDOTmrewv9lEa7d5fxYlk+zd79iBIG3oi1tO0/m/ulIQ/NZWYvev673lk12jB
 BmxrDB/iAcS8eEBVKBzuuZNaO33ur3ZCXg/WVKsylCATUj8xzdIGHw8idbHNt/Wd9XU1
 u1TA==
X-Gm-Message-State: AOAM530s7r+++pxniAw8O7iAZFBGbRlrZqn3leS85a2gEjVm1vxDPXSM
 UtQzrJcggewiX5u0OKKgp0aS9WNtFdN5K79duHsy1dlS
X-Google-Smtp-Source: ABdhPJy/bo/7JfgAqFFsuLzBSqcV08qgnOmQ4eMPRkCWEqZ47miJ/JzybdS0tpntwn0jZWb2n6YUC0usozkj2sXo3fY=
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr192059lfn.30.1592400516680;
 Wed, 17 Jun 2020 06:28:36 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 17 Jun 2020 15:28:26 +0200
Message-ID: <CAC-fF8Sd7Okq9QnJjqzvd0cTpxr6hPRwReb-sxefCP05s5KmBQ@mail.gmail.com>
Subject: Channel-binding support: part 1
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, 
 Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi metze / all,

Following previous discussions and the wip at:
https://gitlab.com/samba-team/samba/-/merge_requests/1262

I think we still cannot allow SASL auth over TLS by default, even if
we start passing bindings when over TLS on both client and server
sides, as long as we don't have support in heimdal for
KERB_AP_OPTIONS_CBT and the GSS_C_CHANNEL_BOUND_FLAG options.

However, I think it will still be useful if we start to pass the
bindings as clients (and as servers when we can), without taking
advantage of it for the above purpose yet.
What we gain is to be able to connect to AD servers with
LdapEnforceChannelBinding=2, and later to samba servers that support
it.

I've updated the MR with patches in that direction, for that I added a
new smb.conf option similar to LdapEnforceChannelBinding, but I'm
unclear yet how this should look like.

Thoughts?

