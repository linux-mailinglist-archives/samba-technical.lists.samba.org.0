Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BD0AD47E2
	for <lists+samba-technical@lfdr.de>; Wed, 11 Jun 2025 03:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vraTKiNI8477CY05dFluHmdT9xg40IS+eMCdDurmLVQ=; b=0ImPsZSa2ecYUsAvmIFAjPNOgJ
	gZhj4oGhDkdYVt5gfSMOun+57x+oM7p1anAjV6vM+y3svwFqQ1jTMH1Rfp1Kj3S5XC+kjiXOo/Np5
	1vUr5sf/cXY/JOsFrqkRuq7JQ6uNQKpVZk+FgDPLhDFQ2xSrnmi1NRE4HtpbmWsPl1Rl59O+o+pzo
	SR/QFMgIi3fQ/znqGQz7lcRdSKmO/1LfzKPoYhHaYmGOk819xh4xLo9yy4IH2Dov9aeCI2QLIDJhq
	USP4pT/WtcPfTXJJVN2ropEmltf7Aqeaq0YMZqB+5lxL065HwvjvQteXoryHKadpmfVb3Cjja0Y51
	bvF2bYIw==;
Received: from ip6-localhost ([::1]:40922 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uPAJX-006y7S-VL; Wed, 11 Jun 2025 01:31:40 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:54302) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uPAJT-006y68-CF
 for samba-technical@lists.samba.org; Wed, 11 Jun 2025 01:31:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-32a6a91f0easo22541321fa.0
 for <samba-technical@lists.samba.org>; Tue, 10 Jun 2025 18:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749605494; x=1750210294; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vraTKiNI8477CY05dFluHmdT9xg40IS+eMCdDurmLVQ=;
 b=JjtZhYiMQl6ylBSwNnUVyhpIXooNg453jMcA1BuVJLHyUQzDoDzl5MkYYVL5PSJyXE
 bfQwq1iKwvZI3W6bkvACFNapjYm1G8Vu0xQkV0TXN5BYr9VoDAmBL14o84W8dapJBfR1
 KVl0YKfoAqIBoQn0rnYDPkMRWS6iCjNQ0649aXWSoon0IpeZZgNnuSZtaoi39d/eUQ7E
 pwfm4hRsmOytgPkBEnvxg91HatQgsQd7yky08RVLJttFEy1gwty/GfF3gV3w3paMJOA6
 zSrUlQEw669aiGLkQ7/ts/RnClRQ2lTDNSdjrPIU8BVsMBiowh/WiHEL5sVGfTDNvqme
 pZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749605494; x=1750210294;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vraTKiNI8477CY05dFluHmdT9xg40IS+eMCdDurmLVQ=;
 b=iXcwdeICkIZ8/n1hLo7kpbEtUVlOnelguWKSdUAjmoqxtAicl4NFpWNucWDXDC0DOv
 /PrB775UM9a8Z7XDY5e4b3KWOaTMDRpDdyeMYD5zBnImdy5QwoO07/0QlkIyNE1+H1Uy
 gSDBer65+3uX41lr6UIQJxlV9BZ8DtJ9SKcu7OXYkKkdnx3NVTNboh+gI23EqhkemI8C
 rRdxrt0fMYQW42BmjhI1yZQO9PcT6y3QCpIjXTkZCm17K6m/E63PhOXOiZa2V1DoZC8y
 bCyl6Xr53TO7O+FXXEpQpKkcmeV9y1SQzn9BuOFat1ixOUQo+vyzGHGQnDMbtwai4Svc
 ieFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDE9MVYhGtfaSxi3qlm/53d22mNmYVjbVmuZN5LVM08tl+pypHLTtRXLSMDnvs3SHdckAAy9YSu8+0dGQsd68=@lists.samba.org
X-Gm-Message-State: AOJu0YxKfTgHwF4QZiXT7n3jQPvpTWoMc1L+npxEFT20sTjhJJSz8g68
 p9WUNAS1YL0aldnaOclpJI3QahrU3p4yaZhaGbPZmf2OoN9+s7r46t+4Z9GIA1wE1tUx4GppekV
 6iliZXnCDy3sLE8rWgZkv7o0lwgegRGg=
X-Gm-Gg: ASbGncvlLGduQDFR5Git0j8uqVD7m+reyiKbMyMlLp9/ENXugpu56hjCr272WVYtV39
 TCXeDvx8c36FRggn8RmGlM2mt2Vyi4fm/GId5p9gV2Fu6AZmXeRV+ZH9FfACcRMLi55uY5dAxUH
 D/TWPPpmejfwv7Ckdldhsv34rpWZ+jYWI9uM61RQJhfMtnnxrZkzCudSLTPvykllJS9aqvEnZ0e
 NJQ0w==
X-Google-Smtp-Source: AGHT+IE4rW7D/o8QA3IDLlv5DmCcDPwX0EnbcKt6buiNsiHyuUDZPtlMGLIrt5C7qvE23puW3c5nLgzUJcd/ebf9X7I=
X-Received: by 2002:a2e:bc11:0:b0:32a:8bf4:3a81 with SMTP id
 38308e7fff4ca-32b22285b8dmr2578301fa.5.1749605493624; Tue, 10 Jun 2025
 18:31:33 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 20:31:22 -0500
X-Gm-Features: AX0GCFtn3fjSd3bm0PUue66pR4M9D8LAwg1yDVZX5nsDQ7DwECVdOQclinbY2h4
Message-ID: <CAH2r5mt_wPk99ns95oV1tjo62VEmw+zCkoxY=8otNNhV=pnX1A@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 7.4
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A new update, version 7.4, of cifs-utils has been released today.
Users of cifs-utils version 7.3 on older kernels are encouraged to
update to 7.4 since it includes a fix for a mount problem with version
7.3 of cifs-utils on older kernels when using namespaces.

Links:

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=cifs-utils.git;a=summary


Detailed list of changes since version 7.3 was released
----------------------------------------------------------------
Enzo Matsumiya (1):
      mount.cifs: retry mount on -EINPROGRESS

Henrique Carvalho (1):
      cifs.upcall: correctly treat UPTARGET_UNSPECIFIED as UPTARGET_APP

Paulo Alcantara (1):
      cifs.upcall: fix memory leaks in check_service_ticket_exits()

Pavel Shilovsky (1):
      cifs-utils: bump version to 7.4

Z. Liu (2):
      getcifsacl, setcifsacl: use <libgen.h> for basename
      cifscreds: use <libgen.h> for basename



-- 
Thanks,

Steve

