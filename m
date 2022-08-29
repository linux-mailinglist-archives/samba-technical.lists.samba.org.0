Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 044E75A549D
	for <lists+samba-technical@lfdr.de>; Mon, 29 Aug 2022 21:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DJ1Vk7PuPRGGXD/aYCdPiXnpozX94l/qj5p7TO/H4cU=; b=qdkTEKVkon2ccefktcvRPzlqb6
	HQbhm9crjn86XY54+NAcWFCIZfiSewAI+2WsBY51o9DQWjFvZn8XWvyk8M9cyvIvrc7UiZumXCB7I
	FTg2pT3v/hRYjGFiwFv79nSLDQw5hOuE7DZuSvmiyLuSausi1aRShNNJjDEYLQLnE+vdFP5SLZVLE
	Y9DUoqicsnCRhElGcVNi7iBhx89nzhhTQfXgOh+r8Mh36N4KZTOVY0ME0ByJCzciNYk1LUSCedoDc
	sjmpBB+h6DOkdF7PTN7+BC13/0wryOw8EucFHADwPBbREthg8HrWtAidYLJ8a22eeDXIU3cRQYuTa
	utU2ylow==;
Received: from ip6-localhost ([::1]:58150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSkYp-002xUf-UN; Mon, 29 Aug 2022 19:36:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43933) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSkYk-002xUW-7C
 for samba-technical@lists.samba.org; Mon, 29 Aug 2022 19:36:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso4968094wmb.2
 for <samba-technical@lists.samba.org>; Mon, 29 Aug 2022 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=to:subject:message-id:date:from:mime-version:from:to:cc;
 bh=4eKIIkDbWLvnwiX+UyqiOltfraFi44a1HQRu0TmGJ2k=;
 b=AYccbyr3exPlB7dAV1UJroh67AVjd3FB3K6bLiT7YvU+Tr/WRYpWyfuWRcC4uJk3QN
 fx0d11KxJZ2/iRwUGH291ZWX0109hn2GoTZT+oG6q3XtWoQ/B1spH/mQaZjk6chyz7mI
 GzxDqUonuHMM7ccv1Jc2uWe9Lh7qD01q6J1OWyigtXjqxJ7UI9CoAYehHl5toBrQNEQ0
 lIBwMNi/r7M3sU6O1+7ixA8mQAgYSjmsJUUHUSvz4tT3SagBMp1HaG5nV6dDZNtWPloH
 C38XkW7/4p1ssGOW6G/qS6/I3Y7+K880A5YvvhbpZZOwUcoevq+qsVGs4ttfeqUJaqeN
 r95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc;
 bh=4eKIIkDbWLvnwiX+UyqiOltfraFi44a1HQRu0TmGJ2k=;
 b=L3ePrjqWE1py1CoMfba8JabeQO+LMexbscoWnjfkLRT6qQUcz5no5WuHV/GBMf78ed
 NNEiYJGlZYhY9e+6DInbE+D8FAOSIfifRgL4YUsBxGxWlksqNYsm9ZNM6HwN3iALN3Dl
 JkVfBI0JzQ0wfVYbkE9N7XnfBDRK081th40056V+iVHU05TB14PoJHY9bijkndkSYrwx
 Mu2ud5cH6aq+sE6GV0oVecfgcUjH3rdZZfcrOl3u/lnW4DpaUJS7gScaz66OnMeWzvj7
 Z0jG6sf9TvE/yya0MgH6E/iJFHg1DmWasDa1u+NexRwX1eOi47u4xtmQxpygYixzfsUS
 dD3A==
X-Gm-Message-State: ACgBeo30EBcFNi1+8vpZ3UEvF33B6FjOT9g24+fpzRTNg2FgkKD8wDIE
 LuaADtLLdHiPly8Z53HW7dU1wGZUDSFS8n1zjlDhwEMdCRExLg==
X-Google-Smtp-Source: AA6agR793UJgdgEHtmqHBTCfgzLTZ+LSBsW+nP7lNDmkKwD1Ds2V8jpy0b7APspfNqV3snPu2fiFqOVpjzbOi3v7mEk=
X-Received: by 2002:a05:600c:2f88:b0:3a5:4014:4b47 with SMTP id
 t8-20020a05600c2f8800b003a540144b47mr7727113wmn.96.1661801792844; Mon, 29 Aug
 2022 12:36:32 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 29 Aug 2022 15:36:21 -0400
Message-ID: <CAB5c7xobm2hCmdmC3rspWC4-YOETb-S4Q7wtfMmccqMZRt8+Hw@mail.gmail.com>
Subject: Samba 4.17.0rc3 opens via vfs_glusterfs fail
To: samba-technical <samba-technical@lists.samba.org>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

```
[2022/08/27 14:48:25.748586,  0]
../../source3/smbd/files.c:1187(synthetic_pathref)
  synthetic_pathref: opening [.] failed
```

Seeing this on trying to connect to share. Looks like we're trying to
glfs_open() <connectpath>/. with flags (O_RDONLY | O_NOFOLLOW |
O_NONBLOCK), and it fails with EISDIR.

Following patch fixes the issue (i.e. on EISDIR reattempting open via
glfs_opendir()).
Has anyone else seen this issue?

```
diff --git a/source3/modules/vfs_glusterfs.c
b/source3/modules/vfs_glusterfs.c
index dd05da0f9bb..22762a8703f 100644
--- a/source3/modules/vfs_glusterfs.c
+++ b/source3/modules/vfs_glusterfs.c
@@ -822,6 +822,11 @@ static int vfs_gluster_openat(struct vfs_handle_struct
*handle,
                                 how->flags);
        }

+       if ((glfd == NULL) && (errno = EISDIR) &&
+           (how->flags == O_NONBLOCK | O_NOFOLLOW)) {
+               glfd = glfs_opendir(handle->data, smb_fname->base_name);
+       }
+
        if (became_root) {
                unbecome_root();
        }
```
