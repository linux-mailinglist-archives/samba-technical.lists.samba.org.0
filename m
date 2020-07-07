Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC31F216AAF
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jul 2020 12:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=n7mpwWtyi/GtPn0VfwnPh9kymMtXitnAn158V07Y+oA=; b=DJviMO8tm3avTEsm0ebg+BI43w
	lvIUq2eA1Gse7wicKUPLXqHAy0PA44zsf3RpHjb0/nWK77Cs3e2QJ7pmEAC58yndJ18zmTz73ROKc
	MurSgxOXf9MRtnLndRL0LM3QtNYK7JDOn3wAieMgYZfokbreRe2IEXk1a4z3TcKTk0ccfmskIcscc
	lZskhYM3t4zaxpFJmWEyia1k7sIK45zUer43fGAKoMcBUt8zOLrEt+wKF4afsxnuwa7vN5Srl0PfX
	VOD1357Rbs3xU/ou/la1cFtNHNy9OpRSqnS5XmEphJSDRYBwO6mqAFi8R2q64XbzsoD0qXnlmrVaC
	zZtJ1igw==;
Received: from localhost ([::1]:44976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsl8f-005t2X-4V; Tue, 07 Jul 2020 10:47:49 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:39547) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsl8Z-005t2Q-Jh
 for samba-technical@lists.samba.org; Tue, 07 Jul 2020 10:47:45 +0000
Received: by mail-lf1-x12b.google.com with SMTP id d21so24434386lfb.6
 for <samba-technical@lists.samba.org>; Tue, 07 Jul 2020 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=n7mpwWtyi/GtPn0VfwnPh9kymMtXitnAn158V07Y+oA=;
 b=fKtL6ylDFwJiGvQHokzkeh+DlMPptM7tmzR/8aueYPtiwV3FO4Y9swt7ksxZu3lnZj
 +Kl4x44qBI2IAE+Yq3WxiXk6F3x1OWPT0ipkaGSU0n5RZVZrckgUD4sKKGNaeY9lUn39
 r5L0xqmXtyi5aFFOI/3bOAYGniSWyavgKgZMZqMhc/aDq/eL41Qwd7M/Wt5K/M9uaDcp
 fMsFlCw1g8FAXquRKXiJaov42SDvJZSylqvtpj/LVcRC/6Lv3IS3Y5rcbQF/CybNNM6v
 3PXYXAhNxrl+Er8qPhU/HNeDstLtF2+FGBPAFDVvaHq0La9ekEG7xcOmGWbmBn9PCVVO
 IA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=n7mpwWtyi/GtPn0VfwnPh9kymMtXitnAn158V07Y+oA=;
 b=tWMYDPmnGuvXmET0RhpeHvBEVPYCM7DYYJlQBQt++lqy1U0f7brBRNSknRoK92Prkz
 z3h3zSD56NZ+OQddh7hPyNzdeUkuItRbWmgN63ZG//ds0rnzAw9MLN1tJ1QTWcg3RIuy
 lwlHiYrjssDBQ2qrhX1Z/4FlnQQyQ/ZZgsk8ZfzkkSozssmgRnSG+IxF+/yzikPnog36
 ofgnCJn/Nz6H+30jduv85w+NHOTfuSJER/9KhOLSzIZkKbPfOEWifahdjAA+u2+kTRhw
 nJbrRhFxUdV4wWG2Ogc3VRu4MsOjitqCMQ3FLygu2p0//au2PxLrPLKj3y0Ex3h3p6We
 X87g==
X-Gm-Message-State: AOAM533LGxkKk02qpcg7rTni0yFx6+fggeqsv1NE3L/t01UgvV+Ogn9/
 V/fMJyTxgrPWOo8lr11eOr3ioXM9Uexnm7JplhdqaVfr
X-Google-Smtp-Source: ABdhPJyQEZJOBlSjhp9fSFoPv7HM6mzJwDDdCO5r4Tsd8gkVgUzAryLUfsQ9L6kunta34RCQrvRk/biKNWhnT80rUTw=
X-Received: by 2002:a19:385a:: with SMTP id d26mr33255101lfj.211.1594118860795; 
 Tue, 07 Jul 2020 03:47:40 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 7 Jul 2020 12:47:30 +0200
Message-ID: <CAC-fF8S_WZuALxjhjFKhYeaKjhrccjq2XG6k=db18o3RYFpWrA@mail.gmail.com>
Subject: Deprecate net -k?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>, 
 Andrew Bartlett <abartlet@samba.org>, Stefan Metzmacher <metze@samba.org>
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

Hi,

I think it has been discussed, but I just want to share some tests I
did in the context of MR 1402 work.

The man page of the net command says:
-k|--kerberos
Try to authenticate with kerberos. Only useful in an Active Directory
environment.

In practice it means that some net-ads commands use ntlm by default,
e.g. net-ads-join force the use of ntlm for the CIFS connection if -k
is not specified, even though it uses krb5 for the LDAP connection.

Fails due to the CIFS failure:
net ads join -UAdministrator@ACME.COM%pwd --option=gensec:ntlmssp=no
Succeeds both krb5:
net ads join -k  -UAdministrator@ACME.COM%pwd --option=gensec:ntlmssp=no

Succeeds both NTLM (although AS-REQs are still being performed):
net ads join -UAdministrator@ACME.COM%pwd --option=gensec:gse_krb5=no
net ads join -k -UAdministrator@ACME.COM%pwd --option=gensec:gse_krb5=no

Other commands such as net-ads-search on the other hand don't seem to
care about the -k flag and only use krb5 (thus fail with
gensec:gse_krb5=no).

I think perhaps we can deprecate the -k option and just do it by default.

