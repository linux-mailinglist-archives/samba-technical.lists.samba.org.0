Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B868B89575
	for <lists+samba-technical@lfdr.de>; Fri, 19 Sep 2025 14:03:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=+Ai7HUg6Gj2Tz4YC0IHl1ASOu3DN42G2mgnc1yHtjyI=; b=bX0WMEgNx0iOHBu6vk+Q4DgbwI
	DcXbHdV3tP5AMMgn1fzTd7rlPOhWppsqPco8kzlDMaKynmY+GVXqasuQoDFg9oLLSAcH+B+0L9kaH
	WcBiDYn/RoOd93I22vVTfE+wPlmfgkrgU0XH66lWr0QISjXA6FDsVHF8fuOMlDqARnH3MElDBeMJz
	Nvd3rexyK61rmdKhjT72MA40AGHe4n0qdgZyMbInkl0mDATX+D7yItmpMuMdJt/qgIN19UXNYUVxR
	1TEUTc/QrI6VJ4c4zkwNu5tvbllJxssPecK1JI6xR+fxYs2dLWcxXCtdhRuURWwnxBuJvjplIBtIt
	dfsSSDcw==;
Received: from ip6-localhost ([::1]:40208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uzZpS-004HvB-9o; Fri, 19 Sep 2025 12:03:06 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:41329) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzZpN-004Hv4-V0
 for samba-technical@lists.samba.org; Fri, 19 Sep 2025 12:03:04 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-79523f3f925so2405676d6.1
 for <samba-technical@lists.samba.org>; Fri, 19 Sep 2025 05:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758283380; x=1758888180; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=t+uPkJtMflUttQ13FSlO2qL5WEHUhjxURaN8p7im2L8=;
 b=NjKu3meRmd64o3SCbI5NO+CFxlX1yNKFs9boqH0h4aqgtQXzlYhHqpG3/ZUXekS+W0
 YChhDPlpmqjeJobJgpmiRboIyOXezS2mXYI5tfNkhlKmq4/W9iHLEBZcxatVp2NoCpky
 DBDAG38GhWuFhqPjU52oTIG/k4MISqD1UMU6rieUN4UaNmNYRe2ihTyS0cBO+QP0wiso
 EnRnP3f+WaD8OdhSYpLPvFaoozIffQCWIbWxcDZAJE91wdb2chOBXT0QW1+b6plH3zAx
 Ea+spwUmZeL2rxrgH3So9Do88MLdpcyH7KEKWpIqD638bf48bX0P/HycJ0OJDOkA+R/m
 kpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758283380; x=1758888180;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t+uPkJtMflUttQ13FSlO2qL5WEHUhjxURaN8p7im2L8=;
 b=EDV5zHQRXLTcMCO+icOBm/OHbQzHa1wXXX1zs/8Nromcr6+goTuQ/aNdmcxMfkGuyI
 QoHzGdzqvNI7AvDrkOM794gfXs09K5APX6A0UtL1LQi58sGiEwakvYqeoqHOtyqMwdC3
 hlsk2Bfy/Vbbs+1Ijtv82JrhBTuN7x3dacLwJ/ddbgdGXvu0XJWzqJztwtLcQWZbnPUS
 qJwHPj4wJbpb4wXk1OH9W0cP3yb6FS6fBTzlKQbdYv4VGoY6mFdF5VUSgCmqinyz2mPS
 T1IpA5vpRfILXPxErJjJU017U91INLtT53AvEa7vljX3z5EbNI3NBBxnPrAZt4U5VsBT
 Aaxg==
X-Gm-Message-State: AOJu0YxkGqh1Gs7frEJKskLN4nhlpevyYTYZV8iK1EvslmMQ4Qr7ItOT
 xjgEBHV2iKrMzXcMJKNb1RFGUTlJP4X6AuOpJWRYyBu9lRvaNVvCDLXgvNLTltnHPSSAn1Dq/WM
 X+lBJkaAzhcwmAZtH26iV6CwwO9YIUzLOg5tP
X-Gm-Gg: ASbGnctTJaM6XzI6p0D6p3dPJ/tGytYSe6jYN5YY82Gin6sh58b7WEXai0opj3ExBel
 g+q0o0MF9V5D/91C5VLZZtmkp94U6uDmE4QhlY7dlgzFoCsfN4rpPoGdIpe0QbpW9GbB1x0h1O4
 FFeG13JSpX1HoGK8md+rhbQIu6nm3XCQwiy228oc4VsdKTBqtayg2XUog2EmPEoeLR/LZkc01gS
 jF29zm6Yw==
X-Google-Smtp-Source: AGHT+IFyY+AdaOd0RZjt8TXY7Nf3XsvVFubWXTxQyEZJX15CW2z4Vx9tIAbJeoZUsFinCF9zACcBJgGTlx0kWmEP3rY=
X-Received: by 2002:a05:6214:260b:b0:797:da24:b27c with SMTP id
 6a1803df08f44-799023efe60mr18562396d6.0.1758283379437; Fri, 19 Sep 2025
 05:02:59 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 19 Sep 2025 17:32:39 +0530
X-Gm-Features: AS18NWD_Yj3dKohQZDuJlhgvYTNGojsV4Yyc2-XmP4_wtoHsHJHbL5OOOi6Ql8k
Message-ID: <CADrT-m+CZf3_pzAkKXB0UVHkd1o6NJR2bN+udTf-PCEdvSS-eQ@mail.gmail.com>
Subject: Proposal to change smbpasswd file format to address Y2K38 coverity
 issue.
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
From: Vinit Agnihotri via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

Coverity Id#1509031 and 1509040, reports Y2K38_SAFETY issue for
'pass_last_set_time' in file "source3/passdb/pdb_smbpasswd.c".
https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssue=1509031
https://scan5.scan.coverity.com/#/project-view/64750/10100?selectedIssue=1509040

Although this is defined as time_t, we are storing it in file as a hex
string of 8 bytes(uint32_t)as opposed to a hex string of 16 bytes
(uint64_t/intmax_t)
Existing entry looks like:
xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C:[U]:LCT-ABCDABCD

Main crux is to ensure conversion of existing entries so that new changes
won't break older file.
I'd like to propose an approach to deal with this issue.

Proposal states that on opening this password file, we check the hex string
which represents "pass_last_set_time". If this string comes out to be 8
bytes, then we flag this as old format and then we read every record one by
one and convert it into a 16 byte hex-string and write it back to file.
New entry would look like:
xyz:0:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:8846F7EAEE8FB117AD06BDD830B7586C:[U]:LCT-ABCDABCDABCDABCD

Along with the above mentioned change, we make necessary changes to
add/delete/modify entries according to the new format.

Please kindly provide comments/suggestions/improvements for the same.

Thanks & Regards,
Vinit.
