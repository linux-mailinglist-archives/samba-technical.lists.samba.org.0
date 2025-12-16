Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2AECC052D
	for <lists+samba-technical@lfdr.de>; Tue, 16 Dec 2025 01:15:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=sZ1bT2M/GjrYq2dq33KTIIgPoVpugaToh82/EXorcXg=; b=yZ+hF0NFDT4Fuxu4rqfT0Fe3g+
	4uIZPQxe2qKxl9osxjsjq81vhnMVGb+jYJxK5tF6nTiuJ1KkW4Oyv4ox7G14XhG2ltmVVGAEuc1yg
	z4SXlAnLbgSFEp6Mw755aru9mvAt063KekYtwRuqYMMeeUbDXM4m/qRa60ZPmN+1JxNnkn+th8ghR
	3XBmf//fN3CmH9zvMA46te4akr/OA6BGT0vNqModeUDLCW1oEkrl4BpiJPb8nQo2GUS2bDNopgh2s
	Coz/Ztsbw7YWAAb5maJmsovvH8WO9MJnDNfdMO/tYEAz8WbkChggBMCjofktHCcYU8RzBuCC562Da
	YjoEyzbA==;
Received: from ip6-localhost ([::1]:22080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vVIhr-00GJIM-Ai; Tue, 16 Dec 2025 00:14:23 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:51571) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vVIhn-00GJIF-LN
 for samba-technical@lists.samba.org; Tue, 16 Dec 2025 00:14:22 +0000
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-8b9d2e33e2dso619728885a.3
 for <samba-technical@lists.samba.org>; Mon, 15 Dec 2025 16:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765844057; x=1766448857; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ee4HMYR85H0GD3s6w1E7zQS4PbcMl390jihLrYwIZ04=;
 b=T90xHoQnzUqLbHZSTacgosngQwrH7aQeIo3jx9B3AFzeZpJjGONRiqngQJCGz14gcT
 jJvtQlbDG6liIPuD+8kDzTyxeWrpRQveCFUhWOvmmUKU72B2Evap22wR7FW3L1ewzi/g
 GOfg6IE3MkgXEK2DvH5RnB1o85X/8l3+zWeunrkO5IIOaJXmcqZiOlJCF1z1NA6cWbH0
 wW0txh3PKt0dWHV1crgly5X76RulKLhB1RhRuPHYKpB3atm4aauLVZuXUrn1cCucve7i
 SRWi1cqg3KmRXqzsyzs+mZF9M7AGB4GcjX/hoD7oHi8z010XjlDENP8EsMVLk+skYLug
 dQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765844057; x=1766448857;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ee4HMYR85H0GD3s6w1E7zQS4PbcMl390jihLrYwIZ04=;
 b=GbnJNvNvIAAWWrwpfEFBTA3Zuj2xf/oGCaD6ZUx71qLqIY892elpkusMJQ4mx3Y4Gu
 FNeqJ4qwvGLkpnXjuFHQzZqSsd/7ER6v88mzub6a4LE/EsvIcOujqvtQpuCqXVRe5W04
 Oh5QRe9msk4tEgBimSD4QkbmJpK6VHKcHBEEO09pAOam0VNO3IvFyw4dlzynXvRtuEhk
 XWq2tsxOIHDGUnd+SGODO7PWbTpggs91TswJZC6wKfHkrMHgvmx61KTPfof/yYcuhW/y
 yek6AgnROQ9xQDOhuP1A/Qpm5dWv1/i/e+hK0NHRH1fidmr93FyeRCtdU3Fav3cYgyM4
 e2Sw==
X-Gm-Message-State: AOJu0Yzb9sbmKf2r7S9M397NVG6gOl8kbbgmp7Nt4DqufWF/znyuPfhe
 zA9vuQnCg6F/FdwOE17SK2n8KiY7kAUISadJ739kfT4T7w5aTIuX31jc8G0UkEr7l5//0zmjJis
 oSaIRzNQ+QAewOquat9DP6FXqk8M1ePtxGhKm
X-Gm-Gg: AY/fxX5zueuP8ml2SKVro1odjZuOtpYtccFYvppHByahlEoNV2as8eAFdzwsDnwky6/
 KUGNwz/yWs5ovHYM6EUjZga6L2BV9o+9uLDsH0gZsvRo9XRJPfClm1OqWLCj3leKlCufSps36Nc
 80nqqGP1CU42pIJ5Sbz5xcmzqgYN7cIJaB+zqxLIL/IB6YzRBcfpkCjqUwLutdXYkcN4FJTMo01
 Ur2fgIUcZ6ApVW/uLgByIB0sjSgvNAG93s/TEdr/bfDqNe42EtY2g+i7Hx2tcNsWwIxdI9/DlvM
 0I5VdWsyX7+mX/6VlOutmh33BA==
X-Google-Smtp-Source: AGHT+IHO4IW3EwsyFcs2nFFqCwUMqmYtC8rInN0cVE4hEcVCsNB9j2QX5mFH9yRbfXf7lZxwiYGhkRHRj4xWBGxOLwk=
X-Received: by 2002:a05:620a:4015:b0:8b5:5a03:36e3 with SMTP id
 af79cd13be357-8bb399d922dmr1798661485a.16.1765844057529; Mon, 15 Dec 2025
 16:14:17 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 16 Dec 2025 02:14:06 +0200
X-Gm-Features: AQt7F2oKRlRlQrMLYtg1U9WOsmYgeUdT9s5SMlhCpCaxBPxFh7UG_QgAVQPQYFo
Message-ID: <CAFPTsJ5JNO4TRgp5PCEravhxmMNSJnHJ9SyRaOUN9Y-2Dzg0dA@mail.gmail.com>
Subject: =?UTF-8?Q?PAC_group_membership_vs_tokenGroupsGlobalAndUniversa?=
 =?UTF-8?Q?l_assumptions=E2=80=8F?=
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
From: sapir kvetny via samba-technical <samba-technical@lists.samba.org>
Reply-To: sapir kvetny <sapirkb123@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

While reviewing recent Microsoft documentation, I noticed that references
suggesting an equivalence between the LDAP attribute
tokenGroupsGlobalAndUniversal and the group membership embedded in Kerberos
PACs appear to have been removed or softened.

From an interoperability with Active Directory perspective, I wanted to ask:
Is it considered safe to assume that the group SIDs included in the PAC
correspond to the same effective group set as tokenGroupsGlobalAndUniversal,
or should these be treated as related but not guaranteed to be identical?


Thanks.
