Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B91C4E50A1
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 11:50:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DG2gLNZztFwyiRqAOG4Wz1dQm5lB/zMGTgcFsNJ6gI8=; b=aGc9t6O4RURs6Ai0l27VosXS3g
	QVMhUBe6MWBBI/W0VV2GA73Ff6G9giq9xrmijz2lHdEfF+LaoH58/WfUkqNx9T4TF4sp0+ImRTCiU
	4QtAEMRsMsqxDiLnHV11VnWwxTaG92BCVTCK93XAnradxiAlr9NTUWuLdFt7mG94jj+pXq0OBHuXX
	WHGUQnkciL8xaDVcMPrCmahHc5jNV4133NTtzVGJnfv/rSNkOsZLJiz5l0RCjClOZD/9OXO0tgASo
	A5g2hTodEdewxz6hD0Cw1NtPWanMejNOiZgU/VoMfNvAL5hy6IBTbIMXuac9xF0ilEFbwzEVIvg4D
	ynhXL7qg==;
Received: from ip6-localhost ([::1]:19366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nWyYX-004N1f-Nf; Wed, 23 Mar 2022 10:49:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39347) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nWyYS-004N1W-KM
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 10:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648032564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=x+05QSl0u+0PMpZ5Tjv39l4NKc8HvT3WYsuT9EvN7Yk=;
 b=HvaDSdSwnULzPdI0HwmpCwKaFanxE1OJJwS1u0DU8JANudMXldZe04PQSPHmuSqfCv7EC5
 8elulYmpgH5gzLctodQIytqbFqMF2sxZPa9OIhcQX4N96ECJSGQC4+E6JPSix7sl8b1/47
 jWv914CAtGDpAnZ5s+5+5WinfBS9zwg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648032564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=x+05QSl0u+0PMpZ5Tjv39l4NKc8HvT3WYsuT9EvN7Yk=;
 b=HvaDSdSwnULzPdI0HwmpCwKaFanxE1OJJwS1u0DU8JANudMXldZe04PQSPHmuSqfCv7EC5
 8elulYmpgH5gzLctodQIytqbFqMF2sxZPa9OIhcQX4N96ECJSGQC4+E6JPSix7sl8b1/47
 jWv914CAtGDpAnZ5s+5+5WinfBS9zwg=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-vxZVUHuPNTu6lW4Povhk3g-1; Wed, 23 Mar 2022 06:33:36 -0400
X-MC-Unique: vxZVUHuPNTu6lW4Povhk3g-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2d7eaa730d9so9775237b3.13
 for <samba-technical@lists.samba.org>; Wed, 23 Mar 2022 03:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=x+05QSl0u+0PMpZ5Tjv39l4NKc8HvT3WYsuT9EvN7Yk=;
 b=e57c0ieZOVDA/M3664igUFSBntpxiAe7tvlG0663NaKKYa6c8DAPeEedlg0L1Xq0EQ
 MhqnIBe8KWbmT5ZrZ5MyD2pmarZWzqr3hmvlu8KBGy80lCalGYbLxONO7+/jBmr+lFIR
 PZUFn5OKielkvchUE8TgO26n1PXT6cpUU1IfBQdvHMVl1/gNJ6qqJFxMtSpzP1t5SLb7
 57ZevZPcPT9tg/S40XuZW06aZOPXOkiH4iJJi8Qd1rl4BsV9LXO5kX4s4p/8NZQ0bNCe
 yWY6ClPNEbgIVhxQ2tGcy2+szHO0oFv/JYTKzkUFA9l4AQDPsim4brKaHEfjtaJwCHpA
 5xCw==
X-Gm-Message-State: AOAM531KIdP+lDxu5ix+63haRT/TYkXhPfrXDDePmQUQYywXztuhf6dH
 8yYjLAhO2Ma+vtYiu4WiJYr63ad8OZ9aCNhdwMzs2iG0EciuuPR95+5PqweX2fL+VikfaXbhSCW
 yIQNAiEZxL4ZFUHO7bPRQjAchQnY5TvoVawYpCZdNQivp
X-Received: by 2002:a25:c607:0:b0:633:ba19:ce7d with SMTP id
 k7-20020a25c607000000b00633ba19ce7dmr24960374ybf.232.1648031616344; 
 Wed, 23 Mar 2022 03:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrsFVlxzOPXtxoEO7Mvob5wFLx7vB3m8fw7f86BHLH84bxFN9f5o/FB9rhfC+l9HpZmiMWLW2NXnwoOJzmZFU=
X-Received: by 2002:a25:c607:0:b0:633:ba19:ce7d with SMTP id
 k7-20020a25c607000000b00633ba19ce7dmr24960365ybf.232.1648031616134; Wed, 23
 Mar 2022 03:33:36 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 23 Mar 2022 11:33:25 +0100
Message-ID: <CAEcb10u6HsW2Z_WpvPWYaCzhdva0ijbUaJ9EVjfguiMBdr2FSQ@mail.gmail.com>
Subject: test, please ignore
To: samba-technical@lists.samba.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pfilipen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
From: Pavel Filipensky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Filipensky <pfilipen@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Testing mail delivery from redhat.com to samba.org.
