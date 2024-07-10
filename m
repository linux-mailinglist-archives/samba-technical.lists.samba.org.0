Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767592CD13
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jul 2024 10:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=dQRD32miCDY45rhTn/QvCDtyw1PvVvg/j/2L1t59Tvo=; b=cchrQ0mQgDFoOZm/vYglvCO1kG
	goOjGb0koCcJZunOFlqJtNgZq9HjgIQrUCEfuhMWvmpQp7k6uXG2rufOCLZku7OBW5rV6oAsJGSlW
	M7qM+trxakDU2EeX29AJO0SVjxB1r9DJj7yWz9LDRLio0PZ1nPQb3H6ki5Hdl5ECdvUon+jwSXsbq
	iC/Jazu2bm7brzEvAImcX6/elI+ihPL0h90CWSrsUdyHueabHifnMyaQxE1elhzzU2Edj4O7lfMAO
	kHbgR2kb+B4HP33JSRoMjWoQpfMZv0C1u8ZloywtCpby7lZm68q3TEIgmM484en1HvmbO0xTxYmmh
	wYrTpB7Q==;
Received: from ip6-localhost ([::1]:55300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sRSmy-000LYL-Ul; Wed, 10 Jul 2024 08:35:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:53561) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sRSmu-000LYE-N2
 for samba-technical@lists.samba.org; Wed, 10 Jul 2024 08:34:58 +0000
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a77cc44f8aaso295987866b.3
 for <samba-technical@lists.samba.org>; Wed, 10 Jul 2024 01:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720600495; x=1721205295; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ufcPVCIAAf2ZceShhLp15WL1JGRtrF/VhWyT6J1mQFc=;
 b=RVHvjJFtG9lyQD2rvHsv+NCSeUyFsvpYa07MzwJ1JvpyNm4esPt1dAjwY2R1zMGDsH
 M05KjZ/r1cOo36/fkX/5IowT5lUukS8OOX+PqL2RXos0SOCdFZopjKMqoMgjKJKzTQuS
 gtuQLzI1PqbtbbsBvgYESULi9Qw1k1Cf2Zl4jtZRrRmPeMpgFgMdWQAlh9eCNZmnMwWd
 dVpncEA2eq7l1lH2kOrFqV8bx5Bk3Na8z/gwBQq+6VORyj/xZ3Dea1B6Rk1GlKQGiV3c
 55s7d+SxsI4UD7sZgoCQPNFPFhYnKMQJsLpiCAgPS5AWGm2DkLJa33v3eXtY53OGwN8W
 goDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720600495; x=1721205295;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ufcPVCIAAf2ZceShhLp15WL1JGRtrF/VhWyT6J1mQFc=;
 b=ZG/R+EBSK0xR91TOxH2kcyLOxjl4CQBZnKMr/iYAZllkbF+S6CQmIGWsgffMNctYK5
 +JnWK9mdVgzowZiP+4+tFaM+zaMy7mccTgG2nnS+kFH/x4ZDkKOpHgls6f3yNm00HlYG
 PcWQ4u+lWJwSvxvgU7cclhgoFsPtkWU0UGK2G1JJwvnRtpiATHSOD/QV7/kd9HISYctp
 i37Yist/djh9TWS3lLUvy9PcrKc/iqtGIM/FY+Na0AG3dYfBQfQ8oTWtGNF3XGS9dRHR
 1YKWDpYzimjAUaP5rdG78MyLTBuaemO7yjSwQi8NgPkrv6GJpyG3M6w467aZYTTYtmHx
 1mvw==
X-Gm-Message-State: AOJu0Yxy3f0xXbGf2AX2//J4WmnveVHbAg+Gn584ytY9KFnMrNL7RjwU
 GjPMZA83KH4S07ktEDtK+S94p1ZAd0UCSuvHqUD4zPnOZmplGv+Orj7WxmCCcUWuUh5fuXYIOJJ
 cMRVGNjcAbLCoq+11ViMpz31afZoPacaiPCgHZg==
X-Google-Smtp-Source: AGHT+IGdO3FiXOLIFjEuPkjYvWzoTVFDrr8WrLl/mgCnTD9YRlXrS6UeiapZU6vH+D2iNotLWOFhkimC07fAgkQk1tQ=
X-Received: by 2002:a05:6402:885:b0:58b:f46f:ae45 with SMTP id
 4fb4d7f45d1cf-594bb773fb7mr3781273a12.23.1720600495082; Wed, 10 Jul 2024
 01:34:55 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 10 Jul 2024 11:34:35 +0300
Message-ID: <CAAu4aPGRqJd7sGeocixh=Zkv0X85HSXtJcJZsM7VM7gPVQx=Wg@mail.gmail.com>
Subject: problem transfer domain dns zones and forest dns zones
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
From: Omnis ludis - games via samba-technical <samba-technical@lists.samba.org>
Reply-To: Omnis ludis - games <sergey.gortinsc17@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

while transferring fsmo roles I encountered a problem transferring the
DomainDnsZones and ForestDnzZones roles in samba 4.20.2, I went to the
samba source code in the fsmo.py file and started studying the code snippet
in the Transfer_dns_role() function

if master_dns_name != new_dns_name:
        lp = sambaopts.get_loadparm()
        creds = credopts.get_credentials(lp, Fallback_machine=True)
        samdb = SamDB(url="ldap://%s" % (master_dns_name),
                      session_info=system_session(),
                      credentials=credits, lp=lp)
and then I discovered a problem in the line SamDB(url="ldap://%s" %
(master_dns_name)
you must use new_dns_name, otherwise the following error will occur when
transferring roles.
Failed to add role 'domaindns': LDAP error 53 LDAP_UNWILLING_TO_PERFORM -
<000020AE: SvcErr: DSID-03152DA8, issue 5003 (WILL_NOT_PERFORM), data 0
since the ability to make corrections to the owner of the video is
prohibited by MSAD, please fix this in the next version of Samba
