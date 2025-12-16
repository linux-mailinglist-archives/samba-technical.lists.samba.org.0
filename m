Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ACECC34C8
	for <lists+samba-technical@lfdr.de>; Tue, 16 Dec 2025 14:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=q7K1/o2ISAtRRixhLA3WO9kre7t8P/5q8pnkl3NlHWk=; b=QjwMCCQR5vLCPYDvhF55NK3JDI
	s7VVyVGO3fiR++dI/mdz2/mjO6qhaTY77yc5CnJw35zdGrV6p3d2qX9Mi0o0/HyWJHX00IBJU8+iS
	X+GjBCRM/9uVigVRkma6a/A4hAWvy12//er+KKsepzYe2VDjFevJRtkjReM/dfYU/LYowZ7sVfsry
	Jg502O9p+FCYJB4c32AvavrT9eaYNLpwxwX1WMekyqB4fUn64BM2B4H/gfdJe/XG0O0DMc4vZpAtv
	F8iiKOGGCx2Rr7kEMKIs9I/Fdg3CM8InxT7KCZfQUVfmUNg/E0Kn9Hjo4CffcJtfTEu6XJ8ZsbaK+
	T+tOmfrA==;
Received: from ip6-localhost ([::1]:40072 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vVVJJ-00GLNI-2v; Tue, 16 Dec 2025 13:41:53 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:61607) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vVVJE-00GLN9-Oe
 for samba-technical@lists.samba.org; Tue, 16 Dec 2025 13:41:51 +0000
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-bc09b3d3b06so2759242a12.2
 for <samba-technical@lists.samba.org>; Tue, 16 Dec 2025 05:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765892506; x=1766497306; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7K1/o2ISAtRRixhLA3WO9kre7t8P/5q8pnkl3NlHWk=;
 b=SV9paLTyMepxZB0y73XYVKgb20G+oNxw7vtpNZCxb3MHrwR7rpX10gi6i84KymaeBC
 1af1hr48SHmWSmZqWQBH0NUZJqw0O1uhz5/wWfNwLXN8380biBjKLTITaoEJ1DFhtjt7
 3EgQYq/dMfP0lYw9ZOH2FJzfZey8G3C1g+pr6YpzZYFb8f/1onUz2+uIUc87qh0MCaOV
 nwxPsAqjaPTRb2oKMPrXNHG7/REo36s/w4PRlF0jZrQzxbELBlq9qB6BQvk5oRq2I8dO
 JOVeLbHfHMjb+bvwmTqbZuJSDpEb5puRV6vHA6O6KpcOjMcFhksj1FVy5GAEeOir9KFy
 AVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765892506; x=1766497306;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q7K1/o2ISAtRRixhLA3WO9kre7t8P/5q8pnkl3NlHWk=;
 b=NF+KiFKCCoSQi/iWI/Wa29qAzcwZMJ2cpvU9qwmArJoRHTgsYx/tR/husqRCqTda+y
 W0pABkCiqlKqlYOD5GQ7M+2jkjJgB6VtOVuSo0GxseYWeTNyjZ6dkLK9osOcKHJ2upbU
 FfvLq373qBvzu6tg7WEvHLKIenR19AB711Z0OWIXI8jQQWO1AM1huF71ocQS9IqMPFBx
 EO77jofLdK8HsezATXeLw+U+LxTN1yt+uaSY7Sa0SxdjJNC6FG4uH4mO+istOYYLCA2o
 0yrFWxfOR+ZfAa/3umI1BugEvSK11ecTsbZQTKBiIU9/Ds50ZJrN3g/NUPtmhwaes1Uv
 KuDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBeee3VplO/xz9S6mSwgf8MMyPI5ceZuEeBei0ELWtrcTnhLHYeQsjS/+LIyR0TmDKy4PUyuWBztuCphoVc6s=@lists.samba.org
X-Gm-Message-State: AOJu0YzVsfqA/iwPVarqYVFt0pCZZZyCzu7V16hWCCdTyov1jP5ODGvl
 igEu9flPB4k9m70zlufjtfkiPSibsEK86KroYDR54fDbOeeLHhZ5AMmAISvNDiIPYFAX7qHZylQ
 WljPkV7LqGJnMb2cP5uU5SgqwektThnQ=
X-Gm-Gg: AY/fxX66PZDceM5kSYoRoRgywZX9ZfwdO1lOCYrQs+D+rhzs3hJYvd2QJdDsOLY+aa/
 8DguQ2d+spE74keIfeipZVhKhyDt8g3j+t4MtBGE1SKgUJE/QaZD/TffsIN0HV4FzlnhuM9/m4W
 jr65xJn2KSVp2XVct7VdvantuuC8F/L2U38dDxrNvEWnDbfNtgdoCdflonF6VC5Z2lO+lTtS3NE
 Q5at9cR2oKDuTobCzqBeu9knVq+TRZLdpHVcXAxfcKnyw32N53cfqvXvCCIsMZK/1//21A=
X-Google-Smtp-Source: AGHT+IGJqeFnYpTazjo5jFGyMX5Fp6F5l/4FBCbOhSvah+1n5FVIeqsdlCtLKjnnAGN77z6JXvwpBmoZlyH+9c3dktM=
X-Received: by 2002:a05:7022:e88e:b0:11b:af12:ba30 with SMTP id
 a92af1059eb24-11f34bde21bmr9887272c88.8.1765892506155; Tue, 16 Dec 2025
 05:41:46 -0800 (PST)
MIME-Version: 1.0
References: <CAHdxDAH+wwwPMr-u+VhRG39_Ty_6gZekUH3pJQWeTs7uqkankw@mail.gmail.com>
In-Reply-To: <CAHdxDAH+wwwPMr-u+VhRG39_Ty_6gZekUH3pJQWeTs7uqkankw@mail.gmail.com>
Date: Tue, 16 Dec 2025 08:41:33 -0500
X-Gm-Features: AQt7F2qOIMVPwbWAJY_WnOnbQxeb2YJyz8qxVsCf4aQrhdiTPDwkvj44sUsX7vE
Message-ID: <CAP5+4qeAgXYesWeHgKnhxKnohef0uEFhmiaO2Gd-COyCAQ9jtQ@mail.gmail.com>
Subject: Re: [Samba] SYSVOL replication (rsync/Unison): is samba-tool ntacl
 sysvolreset mandatory after each sync?
To: Elias Pereira <empbilly@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Sonic via samba-technical <samba-technical@lists.samba.org>
Reply-To: Sonic <sonicsmith@gmail.com>
Cc: samba <samba@lists.samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 16, 2025 at 7:26=E2=80=AFAM Elias Pereira via samba
<samba@lists.samba.org> wrote:
>
> With each SYSVOL replication (GPOs, files, etc.), is it actually
> necessary/mandatory to run samba-tool ntacl sysvolreset to =E2=80=9Ccorre=
ct=E2=80=9D
> permissions?

Not sure about that case but I've found it necessary after editing
GPO's using RSAT.
No clue why but it's been that way for a long time. A bit surprising
that it's never been fixed, kinda like time sync and client update of
PTR records.

