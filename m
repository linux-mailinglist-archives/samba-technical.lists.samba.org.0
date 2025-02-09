Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E56AA2DF9C
	for <lists+samba-technical@lfdr.de>; Sun,  9 Feb 2025 18:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=wCVP/kDUv39vWxJwIofvS1LpnzMZgvQUxgNLP+BH16s=; b=aexnegkckXqG48p8Eg1Kd8IzIS
	zwHc1f75JL2Xg2wXNE25EiSlCIaEBqVrHP7eEmezFabd/eLeXuOKnHRVg3RimRwSlHZPWaOW44YJ7
	BwsxSYP9wWClwczgO3EM5/J+dApHnWTcJwuHxMZYDsjyzMhuspIEsgGR9uyoYEa1zkZTKpMswHLp6
	9mq1TTqEItNbaoms8GOe6Vm1UR6nRRYgoouVHuSVwv/49MR5VrypcEDim+2DHrfcWUqULwifZGrdk
	9G5+691tH+a+uy9ZF69kDryd+uNF5g1zmqT/rVlmHKb7zQk6Bje0N/EUudLlndPmX16byGF+TZeqw
	qhJYS5aA==;
Received: from ip6-localhost ([::1]:32468 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1thBRj-00C530-OL; Sun, 09 Feb 2025 17:50:19 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39525) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1thBRb-00C52r-1g
 for samba-technical@lists.samba.org; Sun, 09 Feb 2025 17:50:14 +0000
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7c3d44ae1so729866b.2
 for <samba-technical@lists.samba.org>; Sun, 09 Feb 2025 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739123407; x=1739728207; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wCVP/kDUv39vWxJwIofvS1LpnzMZgvQUxgNLP+BH16s=;
 b=lIRByemOO4LxF+tRTsL8ixdK0QMRLMfU6y+31w2n7pcTlnyYgX4IYBWTamz2mRP32p
 Gk9wvneU1z6CvdcF1TWZ/GQWEloIRn3/XzASEr65Vr+5s/34gVez7wNJY7GtIsc+8511
 z9CTZ4UNvJ6NYHII18qrzaJdxen5K4lZI5/v5Bt3bzdMRNwvwrAAP5op3TIDOgaKXuY1
 0gYKYYrWmz/YtbafaswGgV4jVntAoobvuJl5OZbk7keHByk46X4f9F0LTJczZQ6w4j69
 1jaAxcvRycGb3NhTONZ9l7seKX627nh4CO4gdStkisBvCj/j2VTvpL4ypB1uv9axM+U4
 /m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739123407; x=1739728207;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wCVP/kDUv39vWxJwIofvS1LpnzMZgvQUxgNLP+BH16s=;
 b=bRATqtQbPsPi08qm4ivXI2Lzme6MHAbvfgCVZPZfCiPIBm4tkCKx+DYJVvP1MXz44p
 X9HFfbyk18A2MDJ50TDcN8UIj7vlYHabvTaSoKXOLZEhGt86CZVqFpmbg5l66B8uwCFu
 N7CUleDS4gq9o++N8jl73hTRkVNDFKP30Drx8talICiqETaeDUOyxTYiR6gWHOwjQfea
 DY70yn87sAPnReIS1DmI8T22GtuBRu3RhUwgCO2UoX17WVf9wYcwFzPp0kBkw9mp9AU4
 TL4QbF0zs+2lR0uDAkfQse8l/q7QR1Hj2Onnjq1XkUwyXHh+BysUMQry21xsfaF0U6TU
 aMvA==
X-Gm-Message-State: AOJu0Yx+tFNAk5bdd8vWKZd/i7n9pG/DllHHa+47ISjI5SuUxc1lKpgP
 dGUJmHqraDwxjk/iF+MZo3XQ70mxbmaJRBqpGQ67gCXPoADPOhA3fT3e4kRG+YEjJ6Ha7bE/+t+
 BVsQrinBs7Et+jxwHo18IafKFR1R9QxY0
X-Gm-Gg: ASbGncsvroiXlwEQgBuxZMC+B+pH2UhRVXGRfZslBrMSpNTYUlaN3pmDjkb9KBi430E
 xQXBTKC7wh9EL/9Cy/m3PrIxfXBeoeLD07LcCh89oDGngBg5ZQYXT5o+H1x5+qEGFU8e68D9W5w
 ==
X-Google-Smtp-Source: AGHT+IFtQ62Zu+dqZPR3ySiSh4yzqqLjzHSU2d5+DdfRVdpCg5h7YZwWX1l3XS+GBavBswCvnobU+AHtCqk1oQLNiIM=
X-Received: by 2002:a17:906:f59b:b0:ab3:17d:bbd5 with SMTP id
 a640c23a62f3a-ab789c7f1f6mr417700566b.11.1739123407409; Sun, 09 Feb 2025
 09:50:07 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 9 Feb 2025 20:49:56 +0300
X-Gm-Features: AWEUYZmV6L_-pbaKED9r7sboRIp1O96jR4erJl1xB-pEp_xeE4yLPc_Q5r5S5Xc
Message-ID: <CAD14uGXnZXbqSMPJWXHfBPBgJ1X2t2QQBpdFXdv+Cgbbi-CwTA@mail.gmail.com>
Subject: facl function vfs_zfsacl.c in linux
To: samba-technical@lists.samba.org
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
From: Sergey Yudin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sergey Yudin <beremour@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I am trying to build samba 4.21.3 with "vfs_zfsacl,vfs_nfs4acl_xattr"
on RockyLinux inside Podman container. "ZFS on linux" built and
installed. Module vfs_zfsacl.c using calls to function "facl" , which
seems to be from sun/solaris systems.
Calls like this: rv = facl(fd, ACE_SETACL, naces, acebuf);
Linux libacl seems NOT to have one.  What linux library can provide
"facl" functions ?.
I saw sunacl library, but it provides facl for FreeBSD.

-- 
Regards..

