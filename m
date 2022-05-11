Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A2523D98
	for <lists+samba-technical@lfdr.de>; Wed, 11 May 2022 21:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=XXF6OYI3qB5yttavT8X42EHp+sKvbnUf1JIGgX6NgFY=; b=TWSe7erElhTZVfHE8AeDw4meio
	4AMY4XQAEr1j0P8VhCRiNoKemKX8j+C+TSZFY/S58Ua840iDUVRK/M+F562cyvMuSncxX2PwDmb7D
	GK7Bqe9byhYCNa+f1lYrtfrrQgElLrqBSB99Xhe6RsTpW9ZDJQ1bedSfZae8SJqN76wBeGyQ5h4Ib
	K4KMzXIFFSE+yyNCVXnZvWLZe9PQXms2J2H9MK4nmPLSW3RYx9T66KkrI3KoyOqJoIPeJT3iCKL7S
	7L+jHuIHtHJEbop1Zi2SQKRbDte0lSGTQBW+PvuRk66QyvXYF1+Pn9LDOMcK28AfQToT52z6NkQ6n
	0VvleS3A==;
Received: from ip6-localhost ([::1]:62648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nos5H-000oK7-5U; Wed, 11 May 2022 19:33:19 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:42899) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nos5C-000oJy-Np
 for samba-technical@lists.samba.org; Wed, 11 May 2022 19:33:16 +0000
Received: by mail-lf1-x12f.google.com with SMTP id b18so5287614lfv.9
 for <samba-technical@lists.samba.org>; Wed, 11 May 2022 12:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XXF6OYI3qB5yttavT8X42EHp+sKvbnUf1JIGgX6NgFY=;
 b=nxwpZRXVnOwm4rI3doQVxeE/xUeSHswRsyAoCuN6or15H3sbP7P+moh3izUYSh8q0o
 vKhwd8GQwUoAQ9X7ZfT/GKK4Ce/Eb8A8spYo8cvOTh4dsuAFtuO2JJF0O5jzUnF646/2
 PdKpNTBqNcOrAI6XNrK7WjixloC96hyYbbYZXo+nL94dfvKU7ps8OJdLG0mZFRHudjaW
 rZYfWnJ8bOrciigZxEZxotB04VlspQFDto9Z/HWT9xNgAihFKe5+m9YEtsroP+i7hVGa
 n6PNeM4bs/4QmkHzeJyar2i1jfbWWJhrLTpe+mB9tIFDVbpAbLufvrgpy90bpZfCN4Zk
 QvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XXF6OYI3qB5yttavT8X42EHp+sKvbnUf1JIGgX6NgFY=;
 b=oLvscWGTO5R9TZtiae9BY4RV2aRQsXE0OE+aLSm+Re5ySngsuCXJFS4H9djnjZYOY6
 oXlEhwk1uVoyQcQ97Gy2BJU0nvAzXOhleHCMKWUT2JNLCLdZPXuuniJl0zXGvYWNARiA
 umNzMCNU6Vxf0Kmie1IxStbryXV3eq7s762ya0STzzqi1UwNAEyFPmBeELmDVNafPAHU
 S8rQUq++4noET4p1rTJDQZsG1GhhGFgo/0MFrD4jiyrYew78W+gUNDTcGNP4nmL7ix2E
 2gNHAMGCDfdNCaRGejkku0ThQF6RTy+tGX0fyyL+qPPupn7QV77yMEFmmQFBU6XdAJjs
 XU7g==
X-Gm-Message-State: AOAM530/01Lu1WxkmfT+ZkwzNyuMFAe3qO3Qya2KkVUFQTnXHS15ykIe
 rRlyEHJSuRTjI80vH/IFVBxPcOq0m27+7Rch8ZM=
X-Google-Smtp-Source: ABdhPJweqdnMSyi9XqObW6kKsNdHrxKx+zPWGJJv17tn1WEi+m85s2En6OuemBGJA8Qpn54NlXDPyXsjnpcipz1rmFA=
X-Received: by 2002:a19:ca0f:0:b0:474:40ca:af2 with SMTP id
 a15-20020a19ca0f000000b0047440ca0af2mr4076979lfg.320.1652297593133; Wed, 11
 May 2022 12:33:13 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 11 May 2022 14:33:01 -0500
Message-ID: <CAH2r5mvoQskGmY5SkgktzS1ZALeq7uk29EpLELLjVwcwYRwT1g@mail.gmail.com>
Subject: misreported st_blocks (AllocationSize)
To: linux-fsdevel <linux-fsdevel@vger.kernel.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Was investigating trying to fix emulation of some fallocate flags, and
was wondering how common is it for a fs to very loosely report
allocation size (st_blocks) for a file - ie the allocation sizes does
not match the allocate ranges returned by fiemap (or
SEEK_HOLE/SEEK_DATA).   Presumably there are Linux fs that coalesce
ranges on the fly so allocation sizes may be a 'guess' for some fs.

How common is this for it to be off?

-- 
Thanks,

Steve

