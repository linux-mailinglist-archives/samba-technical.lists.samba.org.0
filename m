Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603D32B8EF
	for <lists+samba-technical@lfdr.de>; Wed,  3 Mar 2021 16:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=s9RUS4Ggx59Gtg3Ae8l6sHj7cs03XSff2v0ofjFmlL4=; b=qKgcMLkhgHlL+x2S1Uk1Em3Hb3
	PDhoZie057DUMo/UnIkW5+cvxi087aQyoa0Xdrh8LqyY7F9UHkAPl3CltnMZZrnxH36aiYtTeh2oo
	1PWk/+WD9yRL+SlPtPBYM15HOk1Aj8zPx/ZuxFnn0xd26nRpN3gaGg9CmGWKN/EYCITaBRbHqj+rg
	U0kq7eCD9bOAah2Fd+pJlRlzE3hlnojgvCJprQM+joOUeRWPDEAA3z9fsE2nNMr8vDTxs0QKkfVT5
	lmkOKqzPIo/OXmvEr2N7ELhZdbhEV0Uwa2zc2YmroRjfhlJ7ITM5q6BYp7SsMf8mbQKQN0n98QVDF
	a6mo9ENQ==;
Received: from ip6-localhost ([::1]:28146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lHTPY-0040kC-S0; Wed, 03 Mar 2021 15:27:40 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:39768) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lHTPT-0040jG-G9
 for samba-technical@lists.samba.org; Wed, 03 Mar 2021 15:27:38 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 18so29163748lff.6
 for <samba-technical@lists.samba.org>; Wed, 03 Mar 2021 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IVM5Sz2jRbmwVzcgmRPJrpzFKdEpG09eaQt5F8/qtPA=;
 b=ixHtHTfzzbnEU1Dy/wSL+FCUcEr7CmnVI63Wa68EnPTS9MQcK3rFaN2Ow9bXQWxE+x
 A6lPHcBrLGgkp4ZivD697kFWxULBFkjFnWsulCwjX0uvXrL2YLpm2kjXdn+GM6EsfvpN
 pxiyCAtPr0lJ8b2JjWN43+4PA+qc4bqfeyxO4OA4Hp92+V5zzyTdqTbXCt9kaxdsnwD6
 tbEh0DOaX9yfhOd6MOlrh1KDa0k/xFcCxCEEa5ELCj5rrTFZWjKBsSX05h9HwACEIAyk
 lHRhVQM2vfibHwIkYtEDzVYeDQRZcXd03NgtFQWVaP5Bwr0W6MKmu2qIesqEYU0QaOYf
 5sAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IVM5Sz2jRbmwVzcgmRPJrpzFKdEpG09eaQt5F8/qtPA=;
 b=Nlrf5Cy+mHK3bQ2NAHVWe9i8kik6Iemudm9Mb+3dkSuLw3PZhZqPLeLvr7dd+NQkgc
 0G4NN3B+w3pPVyEAorueA1M7ewtn3Lh1F0LIjOv6/HPJvrkJ9XxZSRbO4Q+Y3IPQBptS
 rTfTYxC5nH928120QnkOpaIaEm17gg6QG5uAeFN5lQ8CtJdhlGywQqRHxDWImjfmoeiI
 bOaYBR6pxLkrB4u+ZuS1o5kmavy+OQk/GarRpVey/X24zKpelU1Q+JDTQc8Vh8//NFCP
 w390CIpOrhgo/dHjgweF9All3hSG1oABj9saONn1t3L1hgB8kaUAYCf4JOrKXVVG2fS+
 6IMg==
X-Gm-Message-State: AOAM530tKf2KzrIt4iEw4hwn5KsHw1vxybE7jCuc9YP8nkhPlVd2AS+E
 I97Huo5472Va3aDCmgRZ8IND+apDz/jqmpfZicT3xn9z1sxEkw==
X-Google-Smtp-Source: ABdhPJxMsmUGf8rD5LwPiNZShnRhVTzqAWCGU4urvOgDKO0M+mLCO4/YY3W+k/2RCOQE1xl8zBz1YnJmeB9TNGjxUiQ=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr12856477lfh.60.1614785252581; 
 Wed, 03 Mar 2021 07:27:32 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 3 Mar 2021 20:57:21 +0530
Message-ID: <CAH_vq2FryOcCDD2n7_A-J_HDXfMVO16XE0aXGMfpjeW8oDsVBQ@mail.gmail.com>
Subject: Kerberos support on Samba
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

Hi,

Was going through this.
https://github.com/samba-team/samba/blob/master/source3/include/libsmbclient.h

And I found that we do support Kerberos.  Please correct my understanding


Assumption 1:- does this mean if a user x has permission on SMB share then
he can access SMB shares by sending credentials to callback API and Samba
can use those tokens to forward it to SMB shares and provide the access?
What i understand from t*estBrowse *example , just enable the Kerberos flag
and pass the user credential to call back function. Which internally uses
Kinit to pass the credentials and get TGT and TGS exchanged. And then
libsmbclient forward the request to SMB shares with  TGS received and
initiate TCP session.



Assumption 2:- it's only possible to get the token for the service account
set up for a computer account as mentioned below.

Setspn -s http/<computer-name>.<domain-name> <domain-user-account>
RegardsVikram


<https://github.com/samba-team/samba/blob/master/source3/include/libsmbclient.h>
