Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7BC6FB0FB
	for <lists+samba-technical@lfdr.de>; Mon,  8 May 2023 15:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JUgQt79BHwXMT/GFt42+NvQx7mLydGpa/Jx0QNVxUik=; b=S0+JzFf+Kh3umfB5zeGDFfEkoU
	VP5VOOlcY+bRD8qn7hDD1olfbWyRV6TM0PUAbOdGoxTRDWywK5E3R/JnjddTnqBAhsRBXlao5BG8f
	a7fS/QX+P5pxQKvQ2GqQAbuVxa87mTN50LbAuvFOfYqpdpFJIwMpgLlaHwPKh8+FDDPdmgUCqP54A
	mOEa6H7CP8OK0tV8u7Aj26yhN7iTfswW5VO+tmPqHI42VWMC3Z3rPIw6fpYLEN4F8I7Xi+ekp+QJM
	DXHvvRGqxO0FroPbVIFPJBLbaf0l8MsP5eB7XeRzZ0hZL4eP0K9eUSn865OQgZGMvBcSlcEb0t2ST
	7AmGfRnA==;
Received: from ip6-localhost ([::1]:58494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pw0f5-008uOO-5F; Mon, 08 May 2023 13:12:19 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46321) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pw0ez-008uOF-Ka
 for samba-technical@lists.samba.org; Mon, 08 May 2023 13:12:15 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-b99efd7c335so5948119276.0
 for <samba-technical@lists.samba.org>; Mon, 08 May 2023 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683551531; x=1686143531;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VZRvmVtsBTDLEJBiS9wjcfHzeSylaPkmH9mt+JoV1WI=;
 b=P3WRHjX5RG5wWihmLURWkre9BIuR0Q536BaSQHwAo1kzPbKcL7Sc+HlJLN1khA5Vg0
 k98EFjOTaqb3jBjWk7TlDZR2J0MgqhTk9Rd1lzFgmS4tpE9pn9XPwgpF2TguO1J5cz2o
 rkTBzLl94dODwA15CaT0kxLEtfwkYodBQN7FiJ1Oki140EXFE1LDD6fdRvcpWY9Unmks
 QfUEi7Lz5CAhFUAQMu+okc+iVMIfOWY13Ow9+dYmprNpebZNSfemdxSepvC/u7+lbBTm
 Sxce7gkYnr/2OW5GBMmP/L5Iga2N92zntXNMiDwg44EhaI2x5yTVgsgDqnyCXlmq6HBK
 jDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683551531; x=1686143531;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZRvmVtsBTDLEJBiS9wjcfHzeSylaPkmH9mt+JoV1WI=;
 b=cPUBHAU/8njuXxT+vzxCXNlBVjKH50qPzi7QtCNwhAD5u5f+ZN+nzuy9Skp/5phY4F
 xy7VGIPbL3250rIbjA3ft9Me3q37O8qSdI4j0KfMcpStsXttrEBzqjFzIijme4TdbpRV
 0B5w4LNlAiYv8ih/UfJXn4OcVYlb5dYztkNG4KFZCGWLCOeF+zAz3bqz9+q+nuyutZQq
 cKQoI9Nen5y2gXQCxdnXv5+t2QL/ZeE/hjIUslSyI3bRmXYgUcP4OSLe54G8YQnXkwNW
 iUs3JH95aYVK/5unAi94SJCp4fFyCxXzPjZWAXKE7/mQ1UzLjUk4SQO509rXLn9tx7/w
 Yrvg==
X-Gm-Message-State: AC+VfDxtnd2p8/u3Mx28gaqP+0+r+Ygg33FTgbXIG5t4gxRJY3P4igqh
 56H5D8aaJ9EEWqXo5cH46uHSHpXkMYIfea1GltDAzQUL2Gf9YA==
X-Google-Smtp-Source: ACHHUZ6gZQVpywjEAFy93Eu8FG+DTHjlL9jUqX2Yk8ArHSfTRLE5rGHxVYGF2oDfqY/CjOs4uvajReMFYhJFo6bxZ1M=
X-Received: by 2002:a25:50c1:0:b0:b87:d47e:9bcb with SMTP id
 e184-20020a2550c1000000b00b87d47e9bcbmr10203384ybb.42.1683551531172; Mon, 08
 May 2023 06:12:11 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 8 May 2023 18:42:00 +0530
Message-ID: <CAH_vq2GJs3HU2DK0tjHyq7eJT8FD-wPa2erLNk1+OmTBXvaKfQ@mail.gmail.com>
Subject: Same error code 13
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Vikram Bharti via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vikram Bharti <vikrambharti33@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Team

I am using libsmbclient API *smbc_getFunctionOpendir *to  open a
file/directory . This function returns *error code 13 *in case of *wrong
credentials *and also in case the user is not having permission to view the
file/folder. Now I am unable to interpret whether the return code is due to
wrong credential or forbidden access.


Is there any such API which can *list out the allowed permissions* to a
specific user . Or just to verify whether the * credential i*s valid for
shares.


*Regards*
*Vikram*
