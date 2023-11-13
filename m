Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3467E9C41
	for <lists+samba-technical@lfdr.de>; Mon, 13 Nov 2023 13:38:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=XEFFdYZmxmEdCk1nETEqWlZLpOATsu4WXfLVcXQJ1rc=; b=JLBZyYaNEPcSQ0IpDRbyTif2L6
	LJdyxoHhGXZZLBMs5DmgUNrK/dm/Act25rctpPSiaOazh1MUYqUa4vj/2FseeMHz/v1EbWJMIXzla
	q0zrmZwQMYD1+hWwPFweWimuXwTCSir6sDqGqBBUjXcRcVusUl3oQeOEFDRUwthCFWvNJlJL1df6c
	qJF/ekDldTKhAxgnhQvmkuR7UY/+6Bu6ITTIjNLvtsxBWdkMJRIwHBX6KYay3VuvwvPN6ktcIPC5V
	GjOREx+hOV2oRWWbLHG+skUhbjD4QIXN8zFRnOf4Bx6bzBFogVBtdLpuZqwMkBMR0l17nC+/DYU7x
	rYBsUkXg==;
Received: from ip6-localhost ([::1]:60116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r2WCW-007tRk-5J; Mon, 13 Nov 2023 12:38:00 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:48301) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r2WCR-007tRb-G3
 for samba-technical@lists.samba.org; Mon, 13 Nov 2023 12:37:58 +0000
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d9ace5370a0so4113550276.0
 for <samba-technical@lists.samba.org>; Mon, 13 Nov 2023 04:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699879073; x=1700483873; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+UfuMYGy36cGBZwG2pfXX9MDnTHnIxpoJuuQiJWw7j4=;
 b=WoeMaPNiuYyNzXjCdHTY+Ka1yU6SF+umNPxChc6yVFl+6MzXQ92t539nn5m+W6LHUS
 DHXzI9HskVvSI3yrH6xv6UR98XBxWcdFy4kgWX4nyIHhZZz9u3qrs/VlLK1hwGoPUTMy
 XXihP4Xoequo4DqG8u4WAbyFWv5V6tyJp8Utzp3+GzTWPXM+FJJZNLsPmzTDhivEGG1i
 2nc+N6zKdCjA+t280solrvIhL4Kp0xpxgjUCaV681UjQYKXpfzxawAHkDUC/S8xdMPHy
 TslaCKPVTI9SFfhh1B9NKYnYS1zo12N4gPA7oOhwpqLGW74rYvxzrAqqipuZX1Cb6sy4
 rUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699879073; x=1700483873;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+UfuMYGy36cGBZwG2pfXX9MDnTHnIxpoJuuQiJWw7j4=;
 b=YSSjifBKLME/Yyf+i9jwmhI+FhH90zEBH+39z1MZK6URDmhfE8WVQ9MNVBp1+mQhCF
 XKh12hIARNNO4tfX6WcM+gXkTq+xhy9UHRUHGijKAFMbaZHlC7jR4MxIhikz2Kg5eHRw
 ZjHlHvLV0vyQwVUFyY0QtLY69oYnmHdcdYwDnhp6vqYc4PU/0YwG9OBkeAUBha+sl41J
 xZbUsQ8xg4qtbTyVii/VY/KQdEPdWwBqTZrRgSlIqHsiPputNW4OqCe712ER0+nw1ciO
 qNv0l6UUidoGT/dNEBuAU7raI9Rlvlu7wkpARRE5Tla93zPiIJ/wnnVN6s/+u/+E7DQx
 /x+A==
X-Gm-Message-State: AOJu0YzHEMOr2ml2T/rbuec/hacJLc5CXY75a4sYzxwGszpiyQLz7wPO
 BDlmi8fC2dwp3CovukN0znQ6Tl3mgXOR9fDiwbuDOdQlbDw=
X-Google-Smtp-Source: AGHT+IGW+2/mlROc3USyd2CQCeLKOWUwGjMSq4D2n1ejxIdDoNiP/bjFIsj0JrkmrIHTTD13BunDVGrp0cBLeRtk5tQ=
X-Received: by 2002:a25:7105:0:b0:da0:62d1:bd34 with SMTP id
 m5-20020a257105000000b00da062d1bd34mr3805866ybc.47.1699879073227; Mon, 13 Nov
 2023 04:37:53 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 13 Nov 2023 13:37:42 +0100
Message-ID: <CAOGObpiMd0krLek4p46SYHTZpDwRGfGdD9PbxH_QUvVCe30-OQ@mail.gmail.com>
Subject: Audit log dsdb_group_json_audit with with "userSid": "S-1-5-18"
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
From: Cristian Galvani via samba-technical <samba-technical@lists.samba.org>
Reply-To: Cristian Galvani <galvani.cristian@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!,
I have 3 Dc in my network, I enabled dsdb_group_json_audit on all of these
to json file.
smb.conf:
*log level = 1 auth_json_audit:3@/var/log/samba/auth_json_audit.log
dsdb_json_audit:3@/var/log/samba/dsdb_json_audit.log
dsdb_group_json_audit:5@/var/log/samba/dsdb_group_json_audit.log*
Everything is working as expected, if one my colleague on his local DC
change  group members the activity is recorded properly.
The problem is this, *on all DCs log file in the same moment* there are
some strange  activity recorded with userSid "userSid": "S-1-5-18"
and "remoteAddress": null.
all the activities record the removal of members from some security groups
but some members removed from those groups were not even present, I am sure
of this information because I restored a backup prior to the activity and
the user was not present in the modified group.

Any suggestions?
