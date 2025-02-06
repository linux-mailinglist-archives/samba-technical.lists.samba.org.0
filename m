Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CE3A2AD21
	for <lists+samba-technical@lfdr.de>; Thu,  6 Feb 2025 16:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=F/oKhfXWhBGs/6hrl9D0bbd7SvyuWL+6gTeLuBa+fDU=; b=YCQyRg/i1M4N5nYMjLX4B/4Gs8
	NcrP5EQZHAvefA4KEO8xS96Sit8fWhA7qguaQqfSWgkIs0W+lkyq4+ltIY1D/5hVVlt1r31owHrQe
	uCiGy7qYrWctER0TY0L0OldYxDgkjkytdWy1q26wfYojDkxDkN86ONr9Ccw4u0HFqAPFEbg/lHIKZ
	NJbO+5W85LZFecxVA21GcL2Jtsu1dtlcN0teAEqOw76D9GYjiZ0sXC0N2cjCFLevu2qbYW4qiXM7T
	SYyn3XGDWK61yHy5/4u4ZiOht0mcnJLgy6WXSFaMKBZpPHvGoRFfmnc08tEU6LX/imvfZB5CFxe6i
	DOtJkHRA==;
Received: from ip6-localhost ([::1]:42576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tg4FN-00BvVC-E2; Thu, 06 Feb 2025 15:56:57 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:57463) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tg4FI-00BvV5-QB
 for samba-technical@lists.samba.org; Thu, 06 Feb 2025 15:56:55 +0000
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30761be8fa7so10237711fa.2
 for <samba-technical@lists.samba.org>; Thu, 06 Feb 2025 07:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738857410; x=1739462210; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2UyyqsTlV1iWojRK08HDRL0D5tFhY69e7+hUX/A19nc=;
 b=I+3vgxCQu8b4+4+ST7+90V5FICx0rjFyoS2OHXQ6HQXbJ0Gtv7kgMslEvq+jPMqoF3
 sbFbcj61efehWd/u8k3zPZ1QlHMnDMydo1eEwgKzdNwQwi/oUm+rhc9gK1Ed+zMc4bg+
 Nq8OWTUDnOWByWMBbtMzSXoacpcdIr8aPIE1GAjJokBVeaWYeFVSBsrqPgaKLp9/HIAq
 T3oF1HOLFcqE7wPwyUD2R0QPIMXW3yKwRkMbEhdZ3aCXria305vhFMlkJaR7irCJks5S
 pD6JJc7HbtkngyoQ+0I65QnDsVxvhDMuq0GZ3NwJkt1y9xXVqDwMJZ9Jdsvrkwc5xJVd
 eA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738857410; x=1739462210;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UyyqsTlV1iWojRK08HDRL0D5tFhY69e7+hUX/A19nc=;
 b=eRzC/6NEEoN/hfBU8g21VsOrsbSMEoS5ojmHv+D4q+f/+I4OyMHMBivRuar0NLNhGe
 aMGchXKkvtanRoVIU0f1KydTUqjmMZQ2D/XGVnOwbZkgxSCAe6VX+taG37Y8wjoDBvuQ
 KdQu8y1WrdfBIIbOyYocTW242D3rsvEEx7PeyiE43MBa3FTam+By/yPMflvKAC+nNnq4
 qz/xze4lBWZ2Ywqs9GzCt7m70Qi/v/OvXmww8R4sI5xMOh/Muu7iN7BNvjOp+Z3Qfzk8
 EiDDgsJ+jRNlb3ha3MRwaWq8vH14GTv9v09tdY7jkhrD2Eyx61T/Hat4cGFXNnYCI3qv
 Xl2Q==
X-Gm-Message-State: AOJu0Yzu2xjYMkFV8QgVmxerhmUxJrcmOrVLFkfrEo8Gx0L32f/JbO7w
 wVTWr6sUAnKi5yCxedGolVgUaYb8MP+G5zTmPCcT1BHe3UzEZvyIDasePJBSGVjWgUv7WWjYlza
 beKvYnv9u3Eh57OtiOVu99ZL2kmsFOh3+
X-Gm-Gg: ASbGnct+DGLs1JPAOXcdIk/12c8HCw4s6JYJweI4zPHbM/hfTRMyh1TV+5qpEMkN1Ut
 JsuFD5QoUevZEoCWGqh9dtl4THd/m6oaEDfVKzAf6aC/in1bO+jUbXAeZ6bnajUoGCSnWjITh
X-Google-Smtp-Source: AGHT+IEXmc6FfqbL9W/46tALMCDaYjNIZ1kywMb5akWW0RwqUSGVcKHGUNRiwVBUUH25LUVzVkPThZUrl4sGnX1YkQ4=
X-Received: by 2002:a05:6512:1253:b0:540:2fbb:476c with SMTP id
 2adb3069b0e04-54405a17a51mr2905981e87.15.1738857410087; Thu, 06 Feb 2025
 07:56:50 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 6 Feb 2025 12:56:14 -0300
X-Gm-Features: AWEUYZnoJXkwHz_x6Szr_5H-OzWZA1VnWqHmGIB0Xe53cHYPx3xiPLPK8g99bC0
Message-ID: <CAHdxDAEJ+qG8TqtxokyCtwxAgnZAZ54Hzob8HeNuUJvvk-7MfQ@mail.gmail.com>
Subject: error accessing the wiki
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
From: Elias Pereira via samba-technical <samba-technical@lists.samba.org>
Reply-To: Elias Pereira <empbilly@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hello,

The wiki is returning the error below:

Sorry! This site is experiencing technical difficulties.

Try waiting a few minutes and reloading.

(Cannot access the database)

Backtrace:

#0 /usr/share/mediawiki/includes/libs/rdbms/loadbalancer/LoadBalancer.php(972):
Wikimedia\Rdbms\LoadBalancer->reportConnectionError()
#1 /usr/share/mediawiki/includes/libs/rdbms/loadbalancer/LoadBalancer.php(944):
Wikimedia\Rdbms\LoadBalancer->getServerConnection()
#2 /usr/share/mediawiki/includes/libs/rdbms/database/DBConnRef.php(95):
Wikimedia\Rdbms\LoadBalancer->getConnectionInternal()
#3 /usr/share/mediawiki/includes/libs/rdbms/database/DBConnRef.php(101):
Wikimedia\Rdbms\DBConnRef->ensureConnection()
#4 /usr/share/mediawiki/includes/libs/rdbms/database/DBConnRef.php(313):
Wikimedia\Rdbms\DBConnRef->__call()
#5 /usr/share/mediawiki/includes/language/LCStoreDB.php(61):
Wikimedia\Rdbms\DBConnRef->selectField()
#6 /usr/share/mediawiki/includes/language/LocalisationCache.php(496):
LCStoreDB->get()
#7 /usr/share/mediawiki/includes/language/LocalisationCache.php(542):
LocalisationCache->isExpired()
#8 /usr/share/mediawiki/includes/language/LocalisationCache.php(453):
LocalisationCache->initLanguage()
#9 /usr/share/mediawiki/includes/language/LocalisationCache.php(352):
LocalisationCache->loadSubitem()
#10 /usr/share/mediawiki/includes/language/LocalisationCache.php(368):
LocalisationCache->getSubitem()
#11 /usr/share/mediawiki/includes/language/MessageCache.php(1147):
LocalisationCache->getSubitemWithSource()
#12 /usr/share/mediawiki/includes/language/MessageCache.php(1097):
MessageCache->getMessageForLang()
#13 /usr/share/mediawiki/includes/language/MessageCache.php(1036):
MessageCache->getMessageFromFallbackChain()
#14 /usr/share/mediawiki/includes/language/Message.php(1473):
MessageCache->get()
#15 /usr/share/mediawiki/includes/language/Message.php(970):
Message->fetchMessage()
#16 /usr/share/mediawiki/includes/language/Message.php(1053): Message->format()
#17 /usr/share/mediawiki/includes/title/MalformedTitleException.php(55):
Message->text()
#18 /usr/share/mediawiki/includes/title/MediaWikiTitleCodec.php(92):
MalformedTitleException->__construct()
#19 /usr/share/mediawiki/includes/title/MediaWikiTitleCodec.php(405):
MediaWikiTitleCodec::{closure}()
#20 /usr/share/mediawiki/includes/Title.php(2984):
MediaWikiTitleCodec->splitTitleString()
#21 /usr/share/mediawiki/includes/Title.php(480): Title->secureAndSplit()
#22 /usr/share/mediawiki/includes/MediaWiki.php(89): Title::newFromURL()
#23 /usr/share/mediawiki/includes/MediaWiki.php(162): MediaWiki->parseTitle()
#24 /usr/share/mediawiki/includes/MediaWiki.php(860): MediaWiki->getTitle()
#25 /usr/share/mediawiki/includes/MediaWiki.php(562): MediaWiki->main()
#26 /usr/share/mediawiki/index.php(50): MediaWiki->run()
#27 /usr/share/mediawiki/index.php(46): wfIndexMain()
#28 {main}



-- 
Elias Pereira
