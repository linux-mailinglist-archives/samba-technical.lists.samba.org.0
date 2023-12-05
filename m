Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5789E805E81
	for <lists+samba-technical@lfdr.de>; Tue,  5 Dec 2023 20:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5hoFRWAA46DrUy16nst7NocxVCpaYw2XqhD+JFTl+18=; b=TmX2VuFysCoQ0PQwkWPYZdyI9+
	tuSxd/aEsbgadJHhd68BQXBVxzC73Zg6oWxLJ8ZBxHCePgq/vL/to/n8JIsYTF8fJsHTdPJuoCako
	XWJr51JnzPOp+Q8991bfdua3XBxGTVYJXXz0YqOduas6xteC0YmrAhW5RmLHMHQHpZ7udf/B1/sH6
	n5ZsnDz3e/YGJS2SbMZbn4b610RKNo43WdZUMciPzh9itF3gTJ8sAQLWf9LAW2V1JzQ+eU95qUmgy
	LlzLuVDfYYBpOfQ5JM0/5OhUTW43PuwVSaqehLhy1QHovDW2UFVtOgAR5cMPuZOPQ7zBqUIhBtozw
	Hs4zC4mg==;
Received: from ip6-localhost ([::1]:56028 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rAaym-004U1N-OJ; Tue, 05 Dec 2023 19:21:12 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:58614) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rAayi-004U1E-8k
 for samba-technical@lists.samba.org; Tue, 05 Dec 2023 19:21:10 +0000
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-db3fa47c2f7so4637611276.0
 for <samba-technical@lists.samba.org>; Tue, 05 Dec 2023 11:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701804066; x=1702408866; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5hoFRWAA46DrUy16nst7NocxVCpaYw2XqhD+JFTl+18=;
 b=XxzG8WoaLwUwQpRQywiffIKeQUA2hwHJXcYvlvGIgK64b46DwVcxMVGmCE52ce45QB
 /5nOFlzcJO01bHXNXEGLdVQq59jz1tKbo/ZZQxQaYQO4Tj0fRyk7of8s45VGoSHtEGTS
 hFvzsGijmhodE/9d6cA9qJ7DXLfqygGskHqzCIvhIhwowtlG9x53NMkUUiFGubnf8bLb
 i/+4+7jKGu3WgH+ZvxFQJx/S03BnLjPdXrfXwKR+fkGrWla0Oucz3abJHWp2t8+uMrsr
 n+BL15NUt5uMrYMtSKXjTLvAET+gCjmhObFQ/ETH0o00WlBWz4khXekTh49C0uhXodH8
 4gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701804066; x=1702408866;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5hoFRWAA46DrUy16nst7NocxVCpaYw2XqhD+JFTl+18=;
 b=FuwXhpao5+QQoPszwmo6kXueke0FfW8y0NfoEtLd01IyepV8kqH4mhhpL3gxog6/6Y
 vjW4Rj2ZWyhzhJH67XEouh0R+ud1e2ld0i7vacg5CDZ9pf0cqXW/AyvN+xucuELkMipr
 viDeQDUGTRbMqHLziM1TcWjBA8nLBUe/TnxQ5IQqeiab1VzHuDiJJGW9E2NH+Wet00WL
 /IlEJ+hIhJyr7lcrTZcmCPJ0Qq8uLXlFhDnIMrSu6m89CcF/DQeoOXfUblmvHlWCO/My
 eDrXu4cA0EP8oSrP6ssKqeasChCfUH9Ez74JYKLUZeOTBz+8nC6hArbc3wU3McQyf2ox
 UlVA==
X-Gm-Message-State: AOJu0Ywzqkm3zsWgioKj3On2rWjmFvu/NuFSlcGo10ER5wif4zTqbmXg
 wFxBcFvCjgDddjfIenF92YtaCWuSIfBVL5JxwKYOe+Ez
X-Google-Smtp-Source: AGHT+IHwd8OusJt3chJdRmyAfZPWV9gSsJL1wKIRNY3+UpNcFI6avOeqaeg1aXtBvGuIB9FRa1J/sj4qyvwXf0GmREM=
X-Received: by 2002:a25:c101:0:b0:d81:5d20:97b9 with SMTP id
 r1-20020a25c101000000b00d815d2097b9mr4461262ybf.31.1701804065774; Tue, 05 Dec
 2023 11:21:05 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 5 Dec 2023 14:20:49 -0500
Message-ID: <CAD0Ztp3ZoJTyiEa_MYgvHHrivWW-KAgDTrjH0Yz-BGDPWUnozg@mail.gmail.com>
Subject: Oplock Lease stress test?
To: _samba-tech <samba-technical@lists.samba.org>
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
From: Gordon Ross via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gordon Ross <gordon.w.ross@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Can anyone suggest a stress test for exercising SMB server oplock and
lease activity?

